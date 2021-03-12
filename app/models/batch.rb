class Batch < ApplicationRecord
  belongs_to :item
  belongs_to :purchase

  validates :batch_name, presence: true
  validates :batch_qty, presence: true
end
