class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :just_added
      t.boolean :available
      t.integer :checkout_counter

      t.timestamps null: false
    end
  end
end
