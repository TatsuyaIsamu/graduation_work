class Ranking < ApplicationRecord
  belongs_to :user
  has_many :ranking_items, dependent: :destroy
  accepts_nested_attributes_for :ranking_items
end
