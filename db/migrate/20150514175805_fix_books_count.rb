class FixBooksCount < ActiveRecord::Migration
  def change
    rename_column :users, :books_count, :books_shared
  end
end
