class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_one :user_introduction, dependent: :destroy
  accepts_nested_attributes_for :user_introduction
  has_many :worships, dependent: :destroy
  accepts_nested_attributes_for :worships
  has_many :favorite_shintos, dependent: :destroy
  has_many :favorite_shinto_shintos, through: :favorite_shintos, source: :shinto

end
