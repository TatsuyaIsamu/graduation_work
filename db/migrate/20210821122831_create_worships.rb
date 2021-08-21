class CreateWorships < ActiveRecord::Migration[5.2]
  def change
    create_table :worships do |t|
      t.date :worship_day
      t.integer :weather
      t.text :memo
      t.string :image
      t.references :user, foreign_key: true, null: false
      t.references :shinto, foreign_key: true, null: false

      t.timestamps
    end
  end
end
