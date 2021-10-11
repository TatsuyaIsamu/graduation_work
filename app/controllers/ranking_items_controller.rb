class RankingItemsController < ApplicationController

  def edit
    if params[:q].blank?
      @q = Shinto.ransack(params[:q])
      @shinto = nil
    end
    if params[:format]
      @shinto = Shinto.find(params[:format])
    end
    @ranking_id = params[:ranking_id]
    @ranking_item = RankingItem.find_by(ranking_id: @ranking_id)
    forbid_other_user_access
    @ranking = Ranking.find(@ranking_id)
  end

  def update
    @ranking_item = RankingItem.find(params[:id])
    forbid_other_user_access
    @ranking_item.update(ranking_item_params)
    redirect_to user_introduction_path(@ranking_item.ranking.user.user_introduction.user_id), notice: "#{@ranking_item.ranking.rank}位の神社を更新しました" 
  end

  def search
    @ranking_id = params[:ranking_id]
    @ranking_item_id = params[:id]
    @q = Shinto.ransack(params[:q])
    @shintos = @q.result(distinct: true).page(params[:page]).per(6)
  end

  private
  def ranking_item_params
    params.require(:ranking_item).permit(:shinto_id, :ranking_id, :memo)
  end
  def forbid_other_user_access
    redirect_to home_path, alert: "アクセスできません" if current_user != @ranking_item.ranking.user
  end
end
