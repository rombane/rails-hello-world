class AddPurchaseToBatches < ActiveRecord::Migration[6.0]
  def change
    add_reference :batches, :purchase, null: false, foreign_key: true
  end
end
