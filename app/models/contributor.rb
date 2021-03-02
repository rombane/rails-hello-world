class Contributor < ApplicationRecord
  has_many :greetings

  has_one_attached :profpic

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
