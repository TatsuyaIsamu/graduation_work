class WorshipsController < ApplicationController
  before_action :set_worship, only: %i[ show edit update destroy ]

  def index
    # binding.irb
    @worships = current_user.worships.page(params[:page]).per(10)
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

  private
  def set_worship
    @worship = Worship.find(params[:id])
  end

  def worship_params
    params.require(:worship).permit(:worship_day, :memo, :image, :user_id, :shinto_id, worship_params_attributes: %i[title points memo]).merge(weather: params[:worship][:weather].to_i)
  end
end
