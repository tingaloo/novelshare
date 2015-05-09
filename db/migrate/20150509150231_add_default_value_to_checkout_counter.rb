class AddDefaultValueToCheckoutCounter < ActiveRecord::Migration
  def up
  change_column :books, :checkout_counter, :integer, :default => 0
end

def down
  change_column :books, :checkout_counter, :integer, :default => nil
end
end
