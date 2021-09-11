class Comment < ApplicationRecord
  belongs_to :worship
  belongs_to :user
end
