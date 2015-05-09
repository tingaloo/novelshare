class AddDefaultValueToJustAddedAttribute < ActiveRecord::Migration
  def up
  change_column :books, :just_added, :boolean, :default => true
end

def down
  change_column :books, :just_added, :boolean, :default => nil
end
end
