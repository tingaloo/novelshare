class CreateBookReturns < ActiveRecord::Migration
  def change
    create_table :book_returns do |t|

      t.timestamps null: false
    end
  end
end
