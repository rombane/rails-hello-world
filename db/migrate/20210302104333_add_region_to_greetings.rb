class AddRegionToGreetings < ActiveRecord::Migration[6.0]
  def change
    add_reference :greetings, :region, null: false, foreign_key: true
  end
end
