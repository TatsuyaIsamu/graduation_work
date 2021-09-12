class ShintoUserParam < ApplicationRecord
  belongs_to :user
  belongs_to :shinto
  has_many :shinto_param_items, dependent: :destroy
  accepts_nested_attributes_for :shinto_param_items
end
