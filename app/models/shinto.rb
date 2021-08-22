class Shinto < ApplicationRecord
  has_many :worships
  has_many :favorite_shintos, dependent: :destroy
  has_many :favorite_shinto_users, through: :favorite_shintos, source: :user
end
