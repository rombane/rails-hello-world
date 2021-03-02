class CreateGreetings < ActiveRecord::Migration[6.0]
  def change
    create_table :greetings do |t|
      t.string :word
      t.text :story
      t.string :audio

      t.timestamps
    end
  end
end
