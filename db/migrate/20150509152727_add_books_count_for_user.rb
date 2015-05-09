class AddBooksCountForUser < ActiveRecord::Migration
  def change
    add_column :users, :books_count, :integer
  end
end
