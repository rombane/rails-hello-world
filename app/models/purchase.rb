class Purchase < ApplicationRecord
  
  belongs_to :user
  has_many :batches
  
end
