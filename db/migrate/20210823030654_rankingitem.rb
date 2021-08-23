class Rankingitem < ActiveRecord::Migration[5.2]
  def change
    drop_table :ranking_items
  end
end
