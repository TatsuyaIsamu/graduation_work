class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_one :user_introduction, dependent: :destroy
  accepts_nested_attributes_for :user_introduction
end
