class AddWorshipRefToFavoriteWorships < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorite_worships, :worship, foreign_key: true
  end
end
