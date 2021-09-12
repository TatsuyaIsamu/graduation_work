class ShintoUserParam < ApplicationRecord
  belongs_to :user
  belongs_to :shinto
  has_many :shinto_params, dependent: :destroy
  accepts_nested_attributes_for :shinto_params
end
