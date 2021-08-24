class RemoveColumnsInRankings < ActiveRecord::Migration[5.2]
  def change
    remove_column :rankings, :image, :integer
    remove_column :rankings, :memo, :text
  end
end
