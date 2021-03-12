class AddPhoneNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_number, :string
    add_index :users, :phone_number, unique: true
  end
end
