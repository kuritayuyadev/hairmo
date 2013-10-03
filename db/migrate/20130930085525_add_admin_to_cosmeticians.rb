class AddAdminToCosmeticians < ActiveRecord::Migration
  def change
    remove_column :cosmeticians, :admin
    add_column :cosmeticians, :admin, :boolean, default: false
  end
end
