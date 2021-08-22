class FavoriteShinto < ApplicationRecord
  belongs_to :user
  belongs_to :shinto
end
