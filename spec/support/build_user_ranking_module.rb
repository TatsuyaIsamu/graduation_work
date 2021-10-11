module BuildUserRankingModule
  def build_user_ranking(user)
    ranking1 = create(:ranking, user_id: user.id, rank: 1)
    create(:ranking_item, ranking_id: ranking1.id)
    ranking2 = create(:ranking, user_id: user.id, rank: 2)
    create(:ranking_item, ranking_id: ranking2.id)
    ranking3 = create(:ranking, user_id: user.id, rank: 3)
    create(:ranking_item, ranking_id: ranking3.id)
  end
end