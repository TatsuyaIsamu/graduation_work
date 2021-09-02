class Worship < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :shinto
  has_many :worship_params, dependent: :destroy
  accepts_nested_attributes_for :worship_params
  enum weather: {晴れ: 0, 曇り: 1, 雨: 2, 雪: 3}

  def start_time
    self.worship_day
  end
end

