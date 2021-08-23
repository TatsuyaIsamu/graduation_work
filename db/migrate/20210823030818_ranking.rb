class Ranking < ActiveRecord::Migration[5.2]
  def change
    drop_table :rankings
  end
end
