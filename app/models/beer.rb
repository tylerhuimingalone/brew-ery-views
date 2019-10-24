class Beer < ApplicationRecord
  validates :name, presence: true

  belongs_to :brewery
end
