class WorshipsController < ApplicationController
  before_action :set_worship, only: %i[ show edit update destroy ]

  # GET /worships or /worships.json
  def index
    unless params[:q].blank?
      @q = Worship.ransack(params[:q])
      @worships = @q.result(distinct: true).page(params[:page]).per(7)
    else
      @q = Worship.ransack(params[:q])
      @worships = nil
    end
  end

  # GET /worships/1 or /worships/1.json
  def show
  end

  # GET /worships/new
  def new
    @worship = current_user.worships.build(shinto_id: params[:shinto_id])
    @worship.worship_params.build
  end

  # GET /worships/1/edit
  def edit
  end

  # POST /worships or /worships.json
  def create
    @worship = Worship.new(worship_params)
    respond_to do |format|
      if @worship.save
        format.html { redirect_to @worship, notice: "Worship was successfully created." }
        format.json { render :show, status: :created, location: @worship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @worship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worships/1 or /worships/1.json
  def update
    respond_to do |format|
      if @worship.update(worship_params)
        format.html { redirect_to @worship, notice: "Worship was successfully updated." }
        format.json { render :show, status: :ok, location: @worship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @worship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worships/1 or /worships/1.json
  def destroy
    @worship.destroy
    respond_to do |format|
      format.html { redirect_to worships_url, notice: "Worship was successfully destroyed." }
      format.json { head :no_content }
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worship
      @worship = Worship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worship_params
      params.require(:worship).permit(:worship_day, :memo, :image, :user_id, :shinto_id, worship_params_attributes: %i[title points memo]).merge(weather: params[:worship][:weather].to_i)
    end
end
