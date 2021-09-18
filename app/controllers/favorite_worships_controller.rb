class FavoriteWorshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js
  def create
    @worship = Worship.find(params[:id])
    favorite = current_user.favorite_worships.build(worship_id: params[:id])
    if favorite.save
      render :favorite_worship
    end
  end

  def destroy
    @worship = Worship.find(params[:id])
    favorite = current_user.favorite_worships.find_by(worship_id: params[:id])
    favorite.destroy
    render :favorite_worship
  end

  private
    def favorite_worship_params
      params.require(:favorite_worship).permit(:user_id, :shinto_id)
    end
end
