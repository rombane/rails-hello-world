class Photo < ApplicationRecord

  belongs_to :greeting

  validates :description, presence: true

end
