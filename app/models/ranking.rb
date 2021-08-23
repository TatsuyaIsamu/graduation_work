class Ranking < ApplicationRecord
  belongs_to :user
  has_many :ranking_items
end
