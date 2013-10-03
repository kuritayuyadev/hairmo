class AddImageToCosmeticians < ActiveRecord::Migration
  def change
    add_column :cosmeticians, :image, :string
  end
end
