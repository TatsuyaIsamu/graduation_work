class RemoveShintoIdFromFavoriteWorships < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :favorite_worships, :shintos
    remove_reference :favorite_worships, :shinto, index: true
  end
end
