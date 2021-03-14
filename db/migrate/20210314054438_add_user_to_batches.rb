class AddUserToBatches < ActiveRecord::Migration[6.0]
  def change
    add_reference :batches, :user, null: false, foreign_key: true
  end
end
