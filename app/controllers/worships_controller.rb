class WorshipsController < ApplicationController
  before_action :forbid_from_confirm_reload, only: :confirm
  before_action :set_worship, only: %i[ show edit update destroy ]

  def index
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
    if @worship.save
      render :gosyuin
    else 
      render :new 
    end
  end

  def update
    if @worship.update(worship_params)
      redirect_to @worship, notice: "Worship was successfully updated." 
    else
      render :edit
    end
  end

  def destroy
    @worship.destroy
    redirect_to worships_url, notice: "Worship was successfully destroyed." 
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
    gon.star_array = []
    @worship.worship_params.each_with_index do |param, index|
      gon.star_array << {"confirm_star_count_#{index}": param.points}
    end
    if @worship.invalid?
      @shinto = Shinto.find_by(id: params[:worship][:shinto_id])
      @worship.worship_params.build
      render :new 
    end
  end

  def other_looking 
    @worships = Worship.where(user_id: params[:format])
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
    params.require(:worship).permit(:worship_day, :memo, :image, :user_id, :shinto_id, :weather, worship_params_attributes: %i[title points memo _destroy])
  end
end
