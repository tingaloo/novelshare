class AddConditionToBooks < ActiveRecord::Migration
  def change
    add_column :books, :condition, :string
  end
end
