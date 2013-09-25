class CreateCosmeticians < ActiveRecord::Migration
  def change
    create_table :cosmeticians do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :salon_name
      t.integer :area_id
      t.string :salon_address

      t.timestamps
    end
  end
end
