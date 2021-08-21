class Worship < ApplicationRecord
  belongs_to :user
  belongs_to :shinto
  has_many :worship_params, dependent: :destroy
  accepts_nested_attributes_for :worship_params
end

