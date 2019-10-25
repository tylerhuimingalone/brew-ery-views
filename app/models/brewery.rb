class Brewery < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  has_many :reviews, dependent: :destroy
  has_many :beers
end
