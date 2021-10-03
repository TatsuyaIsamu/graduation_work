class Comment < ApplicationRecord
  belongs_to :worship
  belongs_to :user
  validates :content, presence: true
end
