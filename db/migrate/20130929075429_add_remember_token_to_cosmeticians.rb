class AddRememberTokenToCosmeticians < ActiveRecord::Migration
  def change
	  add_column :cosmeticians, :remember_token, :string
	  add_index	 :cosmeticians, :remember_token
  end
end
