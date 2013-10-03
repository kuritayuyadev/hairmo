class AddPasswordDigestToCosmeticians < ActiveRecord::Migration
  def change
    add_column :cosmeticians, :password_digest, :string
  end
end
