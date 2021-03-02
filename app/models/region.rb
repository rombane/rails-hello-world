class Region < ApplicationRecord
  has_many :greetings

  validates :photomap, presence: true
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 50 }
end
