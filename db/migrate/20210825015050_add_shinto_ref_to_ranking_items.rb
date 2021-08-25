class AddShintoRefToRankingItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :ranking_items, :shinto, foreign_key: true
  end
end
