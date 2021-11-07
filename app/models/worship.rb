class Worship < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :shinto
  has_many :worship_params, dependent: :destroy, inverse_of: :worship
  accepts_nested_attributes_for :worship_params, allow_destroy: true, reject_if: :all_blank
  enum weather: { 晴れ: 0, 曇り: 1, 雨: 2, 雪: 3 }
  has_many :favorite_worships, dependent: :destroy
  # validates :worship_day, presence: true
  has_many :comments, dependent: :destroy
  validate :not_after_today

  def not_after_today
    errors.add(:worship_day, 'Please set today or before today') if worship_day.nil? || worship_day > Date.today
  end

  def start_time
    worship_day
  end

  def worship_stars_params_show(star_array)
    self.worship_params.each do |param|
      star_array << { "star_count_#{param.id}": param.points }
    end
  end
end
