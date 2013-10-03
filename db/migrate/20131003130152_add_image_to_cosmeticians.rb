class AddImageToCosmeticians < ActiveRecord::Migration
  def change
    remove_column :cosmeticians, :image
    add_column :cosmeticians, :image, :string
  end
end
