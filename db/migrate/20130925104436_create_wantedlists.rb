class CreateWantedlists < ActiveRecord::Migration
  def change
    create_table :wantedlists do |t|
      t.integer :cosmeticians_id
      t.string :name
      t.string :days
      t.boolean :sex
      t.string :hair_style
      t.integer :price
      t.string :memo

      t.timestamps
    end
  end
end
