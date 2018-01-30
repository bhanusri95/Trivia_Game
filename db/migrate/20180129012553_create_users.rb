class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :FirstName
      t.string :MiddleName
      t.string :LastName
      t.string :email
      t.integer :PhoneNumber
      t.string :Password
      t.string :ConfirmPassword

      t.timestamps
    end
  end
end
