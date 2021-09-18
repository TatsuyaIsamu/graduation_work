class Shinto < ApplicationRecord
  has_many :worships, dependent: :destroy
  has_many :favorite_shintos, dependent: :destroy
  has_many :favorite_shinto_users, through: :favorite_shintos, source: :user, dependent: :destroy
  geocoded_by :address
  after_validation :geocode
  has_many :ranking_items, dependent: :destroy
  has_many :shinto_user_params, dependent: :destroy
end
