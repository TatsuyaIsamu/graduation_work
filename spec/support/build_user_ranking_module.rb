module BuildUserRankingModule
  def build_user_ranking(user)
    ranking1 = create(:ranking, user_id: user.id, rank: 1)
    create(:ranking_item, ranking_id: ranking1.id)
    ranking2 = create(:ranking, user_id: user.id, rank: 2)
    second_shinto = create(:second_shinto)
    create(:ranking_item, ranking_id: ranking2.id, shinto_id: second_shinto.id)
    ranking3 = create(:ranking, user_id: user.id, rank: 3)
    third_shinto = create(:third_shinto)
    create(:ranking_item, ranking_id: ranking3.id, shinto_id: third_shinto.id)
  end
end
