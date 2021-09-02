class RankingItem < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :shinto, optional: true
  belongs_to :ranking
end
