class AddGreetingToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_reference :photos, :greeting, null: false, foreign_key: true
  end
end
