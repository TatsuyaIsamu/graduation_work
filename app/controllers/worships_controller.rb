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
  end
  
  def edit
  end

  def create
    @worship = Worship.new(worship_params)
    if @worship.save
      redirect_to @worship, notice: "Worship was successfully created." 
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

  def add_worship_param
    @worship = current_user.worships.build(shinto_id: params[:shinto_id][1])
    @worship.worship_params.build.save
    redirect_to new_worship_path(params[:shinto_id][1])
  end

  private
  def set_worship
    @worship = Worship.find(params[:id])
  end

  def worship_params
    params.require(:worship).permit(:worship_day, :memo, :image, :user_id, :shinto_id, worship_params_attributes: %i[title points memo _destroy]).merge(weather: params[:worship][:weather].to_i)
  end
end
