class AddBookCoverUrlToBooks < ActiveRecord::Migration
  def change
  add_column :books, :book_cover_url, :string
  end
end
