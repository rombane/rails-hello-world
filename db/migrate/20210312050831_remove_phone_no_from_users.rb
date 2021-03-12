class RemovePhoneNoFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :phone_no, :string
  end
end
