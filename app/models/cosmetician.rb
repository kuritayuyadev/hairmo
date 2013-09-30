class Cosmetician < ActiveRecord::Base
  attr_accessible :area_id, :email, :name, :password, :salon_address, :salon_name

  has_secure_password

  before_save {|cosmetician| cosmetician.email = email.downcase }
  before_save :create_remember_token









  private
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
