class CreateContributors < ActiveRecord::Migration[6.0]
  def change
    create_table :contributors do |t|
      t.string :username
      t.string :email
      t.date :joindate
      t.string :password
      t.text :bio

      t.timestamps
    end
  end
end
