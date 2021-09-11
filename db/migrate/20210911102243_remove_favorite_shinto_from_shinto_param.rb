class RemoveFavoriteShintoFromShintoParam < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :shinto_params, :favorite_shintos
    remove_reference :shinto_params, :favorite_shinto, index: true
  end
end
