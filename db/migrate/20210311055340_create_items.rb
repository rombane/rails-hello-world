class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :nama_barang
      t.string :no_sku
      t.integer :qty
      t.integer :harga_satuan

      t.timestamps
    end
  end
end
