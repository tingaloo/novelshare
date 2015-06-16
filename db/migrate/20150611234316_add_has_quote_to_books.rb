class AddHasQuoteToBooks < ActiveRecord::Migration
  def change
    add_column :books, :has_quote, :boolean, default: false
  end
end
