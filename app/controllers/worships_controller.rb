class WorshipsController < ApplicationController
  before_action :forbid_from_confirm_reload, only: :confirm
  before_action :set_worship, only: %i[ show edit update destroy ]

  def index
    redirect_to home_path and return if params[:format] == nil
    a = params[:format].to_date
    b = a.end_of_month
    @worships = current_user.worships.where(worship_day: a..b).order(worship_day: :desc).page(params[:page]).per(10)
    gon.star_array = []
    @worships.each do |worship|
      worship.worship_params.each do |param|
        gon.star_array << {"star_count_#{param.id}": param.points}
      end
    end
  end

  def show
    @comments = @worship.comments.order(created_at: :desc).limit(5)
    @comment = @worship.comments.build
    gon.star_array = []
    @worship.worship_params.each do |param|
      gon.star_array << {"star_count_#{param.id}": param.points}
    end
  end

  def new
    @worship = current_user.worships.build(shinto_id: params[:shinto_id])
    @worship.worship_params.build
    @shinto = Shinto.find_by(id: params[:shinto_id])
  end

  def edit
    forbid_other_user_access
    @shinto = @worship.shinto
    @shinto_params = @worship.worship_params
    gon.star_array = []
    @shinto_params.each do |param|
      gon.star_array << param.points
    end
  end

  def create
    @worship = Worship.new(worship_params) 
    worship_para = params[:worship][:worship_param]
    if worship_para
      worship_para[:title].values.length.to_i.times do |i|
        hash = {title: worship_para[:title]["#{i}"], points: worship_para[:points]["#{i}"], memo: worship_para[:memo]["#{i}"]}
        @worship.worship_params.build(hash)
      end
    end
    if params[:back]
      @shinto = Shinto.find_by(id: params[:worship][:shinto_id])
      @worship.worship_params.destroy_all
      @worship.worship_params.build
      render :new
    else
      @worship.save
      render :gosyuin, layout: "index" 
    end
  end

  def update
    dammy = Worship.new(worship_params)
    if dammy.valid?
      @worship.worship_params.destroy_all
      @worship.update(worship_params)
      redirect_to @worship, notice: "参拝情報を変更しました" 
    else
      @shinto = @worship.shinto
      @shinto_params = @worship.worship_params
      gon.star_array = []
      @shinto_params.each do |param|
        gon.star_array << param.points
      end
      flash.now[:alert] = "参拝日を入力して下さい"
      render :edit
    end
  end

  def destroy
    worship_day = @worship.worship_day
    @worship.destroy
    flash[:notice] = "参拝記録を削除しました"
    redirect_to worships_url(worship_day.to_date.beginning_of_month)
  end

  def search
    unless params[:q].blank?
      @q = Shinto.ransack(params[:q])
      @shintos = @q.result(distinct: true).page(params[:page]).per(7)
    else
      @q = Shinto.ransack(params[:q])
      @shintos = nil
    end
  end

  def calendar
    @worships = current_user.worships
  end

  def confirm
    @worship = Worship.new(worship_params)
    if @worship.invalid?
      @shinto = Shinto.find_by(id: params[:worship][:shinto_id])
      @worship.worship_params.destroy_all
      @worship.worship_params.build
      flash.now[:alert] = "参拝日を入力して下さい"
      render :new 
    end
    gon.star_array = []
    @worship.worship_params.each_with_index do |param, index|
      gon.star_array << {"confirm_star_count_#{index}": param.points}
    end
  end

  def other_looking 
    @worships = Worship.where(user_id: params[:format]).order(worship_day: :desc).page(params[:page]).per(10)
    gon.star_array = []
    @worships.each do |worship|
      worship.worship_params.each do |param|
        gon.star_array << {"star_count_#{param.id}": param.points}
      end
    end
    
  end

  private
  def set_worship
    @worship = Worship.find(params[:id])
  end
  def forbid_from_confirm_reload
    if request.get?
      redirect_to search_worships_path and return
    end
  end

  def worship_params
    params.require(:worship).permit(:worship_day, :memo, :image, :image_cache, :user_id, :shinto_id, :weather, worship_params_attributes: %i[title points memo _destroy])
  end
  
  def forbid_other_user_access
    redirect_to home_path, alert: "アクセスできません" if current_user != @worship.user
  end
end
