class AddContributorToGreetings < ActiveRecord::Migration[6.0]
  def change
    add_reference :greetings, :contributor, null: false, foreign_key: true
  end
end
