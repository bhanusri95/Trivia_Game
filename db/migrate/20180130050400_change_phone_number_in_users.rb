class ChangePhoneNumberInUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :PhoneNumber, :string
  end
end
