class AddColumsToRankings < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :image, :string
    add_column :rankings, :memo, :text
  end
end
