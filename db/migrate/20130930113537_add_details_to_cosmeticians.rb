class AddDetailsToCosmeticians < ActiveRecord::Migration
  def change
    change_column :cosmeticians, :provider, :string
	change_column :cosmeticians, :uid, :integer, :limit => 8
  end
end
