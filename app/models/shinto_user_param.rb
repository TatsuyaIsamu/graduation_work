class ShintoUserParam < ApplicationRecord
  belongs_to :user
  belongs_to :shinto
  has_many :shinto_params, dependent: :destroy, inverse_of: :shinto_user_param
  accepts_nested_attributes_for :shinto_params
end
