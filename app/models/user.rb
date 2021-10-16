class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_one :user_introduction, dependent: :destroy
  accepts_nested_attributes_for :user_introduction
  has_many :worships, dependent: :destroy
  has_many :worship_shintos, through: :worships, source: :shinto
  accepts_nested_attributes_for :worships
  has_many :favorite_shintos, dependent: :destroy
  has_many :favorite_shinto_shintos, through: :favorite_shintos, source: :shinto
  has_many :rankings, dependent: :destroy
  accepts_nested_attributes_for :rankings
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :messages, dependent: :destroy
  has_many :shinto_user_params, dependent: :destroy
  has_many :favorite_worships, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  def self.guest
    find_or_create_by!(email: 'guest@gmail.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      a = user.rankings.build(rank: 1)
      a.ranking_items.build.save
      b = user.rankings.build(rank: 2)
      b.ranking_items.build.save
      c = user.rankings.build(rank: 3)
      c.ranking_items.build.save
      user.build_user_introduction
      user.save
    end
  end
  def self.admin_guest
    find_or_create_by!(email: 'admin@gmail.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "admin_user"
      user.admin = true
      a = user.rankings.build(rank: 1)
      a.ranking_items.build.save
      b = user.rankings.build(rank: 2)
      b.ranking_items.build.save
      c = user.rankings.build(rank: 3)
      c.ranking_items.build.save
      user.build_user_introduction
      user.save
    end
  end
end
