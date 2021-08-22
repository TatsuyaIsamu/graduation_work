class FavoriteShinto < ApplicationRecord
  belongs_to :user
  belongs_to :shinto
  has_many :shinto_params, dependent: :destroy
end
