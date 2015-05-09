class AddBooksReadToUsers < ActiveRecord::Migration
  def change
    add_column :users, :books_read, :integer
  end
end
