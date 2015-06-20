class CreateGoodReadsLists < ActiveRecord::Migration
  def change
    create_table :good_reads_lists do |t|

      t.timestamps null: false
    end
  end
end
