class FavoriteShintosController < ApplicationController
  before_action :set_favorite_shinto, only: %i[ show edit update destroy ]

  # GET /favorite_shintos or /favorite_shintos.json
  def index
    @favorite_shintos = FavoriteShinto.all
  end

  # GET /favorite_shintos/1 or /favorite_shintos/1.json
  def show
  end

  # GET /favorite_shintos/new
  def new
    @favorite_shinto = FavoriteShinto.new
  end

  # GET /favorite_shintos/1/edit
  def edit
  end

  # POST /favorite_shintos or /favorite_shintos.json
  def create
    @favorite_shinto = FavoriteShinto.new(favorite_shinto_params)

    respond_to do |format|
      if @favorite_shinto.save
        format.html { redirect_to @favorite_shinto, notice: "Favorite shinto was successfully created." }
        format.json { render :show, status: :created, location: @favorite_shinto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_shinto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_shintos/1 or /favorite_shintos/1.json
  def update
    respond_to do |format|
      if @favorite_shinto.update(favorite_shinto_params)
        format.html { redirect_to @favorite_shinto, notice: "Favorite shinto was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite_shinto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite_shinto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_shintos/1 or /favorite_shintos/1.json
  def destroy
    @favorite_shinto.destroy
    respond_to do |format|
      format.html { redirect_to favorite_shintos_url, notice: "Favorite shinto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_shinto
      @favorite_shinto = FavoriteShinto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_shinto_params
      params.fetch(:favorite_shinto, {})
    end
end
