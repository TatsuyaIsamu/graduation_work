class AddColumsToRankingItems < ActiveRecord::Migration[5.2]
  def change
    add_column :ranking_items, :image, :string
    add_column :ranking_items, :memo, :text
  end
end
