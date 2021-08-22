class CreateFavoriteShintos < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_shintos do |t|
      t.references :user, foreign_key: true, default: false
      t.references :shinto, foreign_key: true, default: false

      t.timestamps
    end
  end
end
