class AddDefaultValueToBooksRead < ActiveRecord::Migration
  def change
    change_column :users, :books_read, :integer, :default => 0
  end
end
