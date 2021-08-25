class RemoveshintoIdFromRankingItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :ranking_items, :shintos
    remove_column :ranking_items, :shinto_id, :bigint
  end
end
