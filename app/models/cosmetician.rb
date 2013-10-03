class Cosmetician < ActiveRecord::Base
  attr_accessible :area_id, :email, :name, :salon_address, :salon_name, :provider, :uid

  #has_secure_password
  before_save {|cosmetician| cosmetician.email = email} #email.downcase
  before_save :create_remember_token

  def self.create_with_omniauth(auth)
	  create! do |cosmetician|
	  cosmetician.provider = auth["provider"]
	  cosmetician.uid = auth["uid"]
	  cosmetician.email = auth["email"]
	  cosmetician.image = auth[""]
	  #cosmetician.password = auth["uid"]  #noztomcheck　これだめでしょ facebookからパスワード取れないから
		if cosmetician.provider == "facebook" 
		  cosmetician.name = auth["info"]["name"]
		else
		  cosmetician.name = auth["info"]["nickname"]
		end
	end
  end
	  



  private
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
