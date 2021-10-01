class Worship < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :shinto
  has_many :worship_params, dependent: :destroy, inverse_of: :worship
  accepts_nested_attributes_for :worship_params, allow_destroy: true, reject_if: :all_blank
  enum weather: {晴れ: 0, 曇り: 1, 雨: 2, 雪: 3}
  has_many :favorite_worships, dependent: :destroy
  validates :worship_day, presence: true
  has_many :comments, dependent: :destroy
  def start_time
    self.worship_day
  end


end

