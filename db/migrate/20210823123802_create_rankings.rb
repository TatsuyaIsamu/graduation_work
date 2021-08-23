class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.integer :rank
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
