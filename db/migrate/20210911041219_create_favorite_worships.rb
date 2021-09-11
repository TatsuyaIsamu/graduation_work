class CreateFavoriteWorships < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_worships do |t|
      t.references :user, foreign_key: true
      t.references :shinto, foreign_key: true

      t.timestamps
    end
  end
end
