class FavoriteShintosController < ApplicationController
  before_action :set_favorite_shinto, only: %i[ destroy ]

  # GET /favorite_shintos or /favorite_shintos.json
  def index
    @favorite_shintos = FavoriteShinto.page(params[:page]).per(7)
  end


  # POST /favorite_shintos or /favorite_shintos.json
  def create
    @favorite_shinto = current_user.favorite_shintos.build(shinto_id: params[:shinto_id])

    respond_to do |format|
      if @favorite_shinto.save
        format.html { redirect_to shintos_path}
        format.json { render :show, status: :created, location: @favorite_shinto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_shinto.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy  
    @favorite_shinto.destroy
    respond_to do |format|
      format.html { redirect_to shintos_path}
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
