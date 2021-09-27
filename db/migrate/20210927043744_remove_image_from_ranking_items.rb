class RemoveImageFromRankingItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :ranking_items, :image, :string
  end
end
