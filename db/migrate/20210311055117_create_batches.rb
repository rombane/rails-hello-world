class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.string :batch_name
      t.integer :batch_qty

      t.timestamps
    end
  end
end
