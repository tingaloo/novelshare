class AddQuoteToBook < ActiveRecord::Migration
  def change
    add_column :users, :quote, :text
  end
end
