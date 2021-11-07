class WorshipsController < ApplicationController
  before_action :forbid_from_confirm_reload, only: :confirm
  before_action :set_worship, only: %i[show edit update destroy]
  before_action :gon_star_array_define, only: %i[index show edit update confirm other_looking]

  def index
    redirect_to home_path and return if params[:format].nil?
    month_head = params[:format].to_date
    month_tail  = month_head.end_of_month
    @worships = current_user.worships.where(worship_day: month_head..month_tail).order(worship_day: :desc).page(params[:page]).per(10)
    @worships.each do |worship|
      worship.worship_stars_params_show(gon.star_array)
    end
  end

  def show
    @comments = @worship.comments.order(created_at: :desc).limit(5)
    @comment = @worship.comments.build
    @worship.worship_stars_params_show(gon.star_array)
  end


  def new
    @worship = current_user.worships.build(shinto_id: params[:shinto_id])
    @worship.worship_params.build
    @shinto = Shinto.find_by(id: params[:shinto_id])
  end

  def edit
    forbid_other_user_access
    shinto_information_from_worship
    worship_stars_params_for_edit
  end

  def create
    @worship = Worship.new(worship_params)
    worship_para = params[:worship][:worship_param]
    if worship_para
      worship_para[:title].values.length.to_i.times do |i|
        hash = { title: worship_para[:title][i.to_s], points: worship_para[:points][i.to_s],
                memo: worship_para[:memo][i.to_s] }
        @worship.worship_params.build(hash)
      end
    end
    if params[:back]
      @shinto = Shinto.find_by(id: params[:worship][:shinto_id])
      @worship.worship_params_destroy_build
      render :new
    else
      @worship.save
      render :gosyuin, layout: 'index'
    end
  end


  def update
    dammy = Worship.new(worship_params)
    if dammy.valid?
      @worship.worship_params.destroy_all
      @worship.update(worship_params)
      redirect_to @worship, notice: '参拝情報を変更しました'
    else
      shinto_information_from_worship
      worship_stars_params_for_edit
      @worship.worship_day_validate_messages
      render :edit
    end
  end

  def destroy
    worship_day = @worship.worship_day
    @worship.destroy
    flash[:notice] = '参拝記録を削除しました'
    redirect_to worships_url(worship_day.to_date.beginning_of_month)
  end

  def search
    @q = Shinto.ransack(params[:q])
    if params[:q].blank?
      @shintos = nil
    else
      @shintos = @q.result(distinct: true).page(params[:page]).per(7)
    end
  end

  def calendar
    @worships = current_user.worships
  end

  def confirm
    @worship = Worship.new(worship_params)
    if @worship.invalid?
      @shinto = Shinto.find_by(id: params[:worship][:shinto_id])
      @worship.worship_params_destroy_build
      worship_day_validate_messages
      render :new
    end
    @worship.worship_params.each_with_index do |param, index|
      gon.star_array << { "confirm_star_count_#{index}": param.points }
    end
  end

  def other_looking
    @worships = Worship.where(user_id: params[:format]).order(worship_day: :desc).page(params[:page]).per(10)
    @worships.each do |worship|
      worship_stars_params_show(worship)
    end
  end

  private

  def set_worship
    @worship = Worship.find(params[:id])
  end

  def forbid_from_confirm_reload
    redirect_to search_worships_path and return if request.get?
  end

  def worship_params
    params.require(:worship).permit(:worship_day, :memo, :image, :image_cache, :user_id, :shinto_id, :weather,
                                    worship_params_attributes: %i[title points memo _destroy])
  end

  def forbid_other_user_access
    redirect_to home_path, alert: 'アクセスできません' if current_user != @worship.user
  end

  def shinto_information_from_worship
    @shinto = @worship.shinto
    @shinto_params = @worship.worship_params
  end

  def worship_stars_params_for_edit
    @shinto_params.each do |param|
      gon.star_array << param.points
    end
  end

  def gon_star_array_define
    gon.star_array = []
  end

  def worship_day_validate_messages
    flash.now[:alert] = '参拝日を入力して下さい' if @worship.worship_day.blank?
    flash.now[:alert] = '明日以降の日付で申請はできません' if @worship.worship_day
  end
end
