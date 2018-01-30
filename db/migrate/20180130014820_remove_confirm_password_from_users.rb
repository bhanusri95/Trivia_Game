class RemoveConfirmPasswordFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :ConfirmPassword, :string
  end
end
