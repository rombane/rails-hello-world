class Greeting < ApplicationRecord
  belongs_to :contributor
  has_many :photos
  belongs_to :region

  validates :word, presence: true
  validates :story, presence: true
  validates :audio, presence: true
end
