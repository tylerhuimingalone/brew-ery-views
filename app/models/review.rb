class Review < ApplicationRecord
  validates :rating, numericality: {minimum: 1, maximum: 5, only_integer: true }

  belongs_to :brewery
  belongs_to :user
  has_many :votes
end
