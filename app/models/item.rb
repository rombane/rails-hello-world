class Item < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_items, 
    against: :nama_barang,
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  has_one_attached :foto_barang

  has_many :batches

  validates :nama_barang, presence: true
  validates :qty, presence: true
  validates :harga_satuan, presence: true



end
