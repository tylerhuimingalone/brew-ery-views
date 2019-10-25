class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :username, presence: true
  validates :password, length: { minimum: 7 }, on: :create
  validates :password, length: { minimum: 7 }, on: :update, allow_blank: true
  validates :admin, inclusion: { in: [true, false] }

  has_many :reviews
  has_many :votes
end
