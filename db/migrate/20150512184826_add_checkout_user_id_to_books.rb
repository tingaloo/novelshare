class AddCheckoutUserIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :checkout_user_id, :integer
  end
end
