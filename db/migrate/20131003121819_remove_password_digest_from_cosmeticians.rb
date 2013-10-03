class RemovePasswordDigestFromCosmeticians < ActiveRecord::Migration
  def up
    remove_column :cosmeticians, :password_digest
  end

  def down
    add_column :cosmeticians, :password_digest, :string
  end
end
