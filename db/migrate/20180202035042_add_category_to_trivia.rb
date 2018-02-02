class AddCategoryToTrivia < ActiveRecord::Migration[5.1]
  def change
    add_column :trivia, :category, :string
  end
end
