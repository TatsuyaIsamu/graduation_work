class ShintoParam < ApplicationRecord
  belongs_to :shinto_user_param
  has_many :shinto_param_items, dependent: :destroy, inverse_of: :shinto_param
  accepts_nested_attributes_for :shinto_param_items

end
