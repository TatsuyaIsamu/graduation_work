class CreateRankingItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ranking_items do |t|
      t.references :shinto, foreign_key: true, null: false
      t.references :ranking, foreign_key: true, null: false

      t.timestamps
    end
  end
end
