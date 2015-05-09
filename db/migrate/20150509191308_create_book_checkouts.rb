class CreateBookCheckouts < ActiveRecord::Migration
  def change
    create_table :book_checkouts do |t|
      t.integer  :book_id
      t.integer  :user_id
      t.datetime :return_deadline
      t.timestamps null: false
    end
  end
end
