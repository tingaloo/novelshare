class FixIndex < ActiveRecord::Migration
  def up
  remove_index :users, :email if Rails.env == 'production'
  end
end
