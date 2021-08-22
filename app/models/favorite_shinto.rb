class FavoriteShinto < ApplicationRecord
  belongs_to :user
  belongs_to :shinto
  has_many :shinto_params, dependent: :destroy
  accepts_nested_attributes_for :shinto_param
end
