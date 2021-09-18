class FavoriteWorship < ApplicationRecord
  belongs_to :user
  belongs_to :worship
end
