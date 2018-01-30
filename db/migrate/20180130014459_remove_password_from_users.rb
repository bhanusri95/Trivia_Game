class RemovePasswordFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :Password, :string
  end
end
