class CreateWorshipParams < ActiveRecord::Migration[5.2]
  def change
    create_table :worship_params do |t|
      t.string :title
      t.integer :points
      t.text :memo
      t.references :worships, foreign_key: true, null: false

      t.timestamps
    end
  end
end
