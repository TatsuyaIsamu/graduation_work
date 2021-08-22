class CreateShintoParams < ActiveRecord::Migration[5.2]
  def change
    create_table :shinto_params do |t|
      t.string :title
      t.integer :points
      t.text :memo
      t.references :favorite_shinto, foreign_key: true, null: false

      t.timestamps
    end
  end
end
