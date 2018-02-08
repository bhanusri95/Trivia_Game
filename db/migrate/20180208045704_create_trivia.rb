class CreateTrivia < ActiveRecord::Migration[5.1]
  def change
    create_table :trivia do |t|
      t.string :question
      t.string :answer
      t.integer :user_id
      
      t.timestamps
    end
  end
end
