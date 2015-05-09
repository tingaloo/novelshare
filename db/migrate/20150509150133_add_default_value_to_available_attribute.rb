class AddDefaultValueToAvailableAttribute < ActiveRecord::Migration
  def up
  change_column :books, :available, :boolean, :default => true
end

def down
  change_column :books, :available, :boolean, :default => nil
end
end
