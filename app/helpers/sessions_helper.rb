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

	def current_cosmetician?(cosmetician)
		cosmetician == current_cosmetician
	end

	def signed_in_cosmetician
		unless signed_in?
			store_location
			redirect_to signin_url
		end
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to]||default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end
end
