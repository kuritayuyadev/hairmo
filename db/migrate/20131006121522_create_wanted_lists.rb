class CreateWantedLists < ActiveRecord::Migration
  def change
    create_table :wanted_lists do |t|
      t.string :name
      t.string :days
      t.boolean :sex
      t.string :hair_style
      t.integer :price
      t.string :memo
      t.integer :cosmetician_id

      t.timestamps
    end
  end
end
