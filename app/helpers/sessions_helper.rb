module SessionsHelper

	def sign_in(cosmetician)
		cookies.permanent[:remember_token] = cosmetician.remember_token
		self.current_cosmetician = cosmetician
	end

	def signed_in?
		!current_cosmetician.nil?
	end

	def sign_out
		self.current_cosmetician = nil
		cookies.delete(:remember_token)
	end

	def current_cosmetician=(cosmetician)
		@current_cosmetician = cosmetician
	end

	def current_cosmetician
		@current_cosmetician ||= Cosmetician.find_by_remember_token(cookies[:remember_token])
	end
end
