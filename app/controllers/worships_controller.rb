class WorshipsController < ApplicationController
  before_action :set_worship, only: %i[ show edit update destroy ]

  def index
    a = params[:format].to_date
    b = a.end_of_month
    @worships = current_user.worships.where(worship_day: a..b).order(worship_day: :desc).page(params[:page]).per(10)
  end

  def show
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
    worship_para[:title].values.length.to_i.times do |i|
      hash = {title: worship_para[:title]["#{i}"], points: worship_para[:points]["#{i}"], memo: worship_para[:memo]["#{i}"]}
      @worship.worship_params.build(hash)
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
  end

  private
  def set_worship
    @worship = Worship.find(params[:id])
  end

  def worship_params
    params.require(:worship).permit(:worship_day, :memo, :image, :user_id, :shinto_id, :weather, worship_params_attributes: %i[title points memo _destroy])
  end
end
