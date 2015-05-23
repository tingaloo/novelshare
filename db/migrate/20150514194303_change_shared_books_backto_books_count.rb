class ChangeSharedBooksBacktoBooksCount < ActiveRecord::Migration
  def change
    rename_column :users, :books_shared, :books_count
  end
end
