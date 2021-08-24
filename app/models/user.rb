class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_one :user_introduction, dependent: :destroy
  accepts_nested_attributes_for :user_introduction
  has_many :worships, dependent: :destroy
  accepts_nested_attributes_for :worships
  has_many :favorite_shintos, dependent: :destroy
  has_many :favorite_shinto_shintos, through: :favorite_shintos, source: :shinto
  has_many :rankings, dependent: :destroy
  accepts_nested_attributes_for :rankings
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

end
