class CreateShintos < ActiveRecord::Migration[5.2]
  def change
    create_table :shintos do |t|
      t.string :name
      t.string :address
      t.string :origin_shrine
      t.string :origin_term
      t.text :origin_history
      t.string :main_kamisama
      t.string :sub_kamisama1
      t.string :sub_kamisama2
      t.string :original_url
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
