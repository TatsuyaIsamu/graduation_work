class CreateRankingItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ranking_items do |t|
      t.integer :rank
      t.references :user, foreign_key: true, null: false
      t.references :shinto, foreign_key: true, null: false

      t.timestamps
    end
  end
end
