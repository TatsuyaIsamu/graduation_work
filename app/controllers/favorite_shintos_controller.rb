class FavoriteShintosController < ApplicationController
  def index
    @favorite_shintos = current_user.favorite_shintos.page(params[:page]).per(7)
  end

  respond_to? :js
  def create
    @shinto = Shinto.find(params[:id])
    favorite = current_user.favorite_shintos.build(shinto_id: params[:id])
    render :favorite_shinto if favorite.save
  end

  def destroy
    @shinto = Shinto.find(params[:id])
    favorite = current_user.favorite_shintos.find_by(shinto_id: params[:id])
    favorite.destroy
    render :favorite_shinto
  end

  private

  def favorite_shinto_params
    params.require(:favorite_shinto).permit(:user_id, :shinto_id)
  end
end
