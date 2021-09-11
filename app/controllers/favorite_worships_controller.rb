class FavoriteWorshipsController < ApplicationController
  
  def create
    @favorite_worship = FavoriteWorship.new(favorite_worship_params)

    respond_to do |format|
      if @favorite_worship.save
        format.html { redirect_to @favorite_worship, notice: "Favorite worship was successfully created." }
        format.json { render :show, status: :created, location: @favorite_worship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_worship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @favorite_worship = FavoriteWorship.find(params[:id])
    @favorite_worship.destroy
    respond_to do |format|
      format.html { redirect_to favorite_worships_url, notice: "Favorite worship was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def favorite_worship_params
      params.require(:favorite_worship).permit(:user_id, :shinto_id)
    end
end
