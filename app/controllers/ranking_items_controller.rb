class RankingItemsController < ApplicationController

  # GET /ranking_items/1/edit
  def edit
    if params[:q].blank?
      @q = Shinto.ransack(params[:q])
      @shinto = nil
    end
    if params[:format]
      @shinto = Shinto.find(params[:format])
    end
    @ranking_id = params[:ranking_id]
    @ranking = Ranking.find(@ranking_id)
    @ranking_item = RankingItem.find_by(ranking_id: @ranking_id)
  end

  # PATCH/PUT /ranking_items/1 or /ranking_items/1.json
  def update
    @ranking_item = RankingItem.find(params[:id])
    respond_to do |format|
      if @ranking_item.update(ranking_item_params)
        format.html { redirect_to user_introduction_path(@ranking_item.ranking.user.user_introduction.id), notice: "Ranking item was successfully updated." }
        format.json { render :show, status: :ok, location: @ranking_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ranking_item.errors, status: :unprocessable_entity }
      end
    end
  end
  def search
    @ranking_id = params[:ranking_id]
    @ranking_item_id = params[:id]
    @q = Shinto.ransack(params[:q])
    @shintos = @q.result(distinct: true).page(params[:page]).per(6)
  end

  private
    # Only allow a list of trusted parameters through.
    def ranking_item_params
      params.require(:ranking_item).permit(:shinto_id, :ranking_id, :image, :memo)
    end
end
