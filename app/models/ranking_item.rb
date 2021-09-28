class RankingItem < ApplicationRecord
  belongs_to :shinto, optional: true
  belongs_to :ranking
end
