class AddDefaultToBooksShared < ActiveRecord::Migration
  def change
    change_column :users, :books_shared, :integer, :default => 0
  end
end
