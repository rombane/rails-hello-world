class AddPhoneNoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_no, :string
  end
end
