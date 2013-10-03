class AddAdminToCosmeticians < ActiveRecord::Migration
  def change
    add_column :cosmeticians, :admin, :boolean, default: false
  end
end
