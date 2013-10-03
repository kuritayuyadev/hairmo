class RemovePasswordFromCosmeticians < ActiveRecord::Migration
  def up
    remove_column :cosmeticians, :password
  end

  def down
    add_column :cosmeticians, :password, :string
  end
end
