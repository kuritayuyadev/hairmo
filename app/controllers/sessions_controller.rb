class SessionsController < ApplicationController

	def new 
	end

	#nomal login
	def create
		cosmetician =  Cosmetician.find_by_email(params[:session][:email])
		if cosmetician && cosmetician.authenticate(params[:session][:password]) 
			sign_in cosmetician
			redirect_back_or cosmetician
		else
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
    
	#facebook login 
	def callback
		auth = request.env["omniauth.auth"]
		cosmetician = Cosmetician.find_by_provider_and_uid(auth["provider"],auth["uid"]) 
		if cosmetician
			session[:cosmetician_id] = cosmetician.id
			sign_in cosmetician
			redirect_back_or cosmetician
		else
			Cosmetician.create_with_omniauth(auth)
			cosmetician = Cosmetician.find_by_provider_and_uid(auth["provider"],auth["uid"])
			if cosmetician
				sign_in cosmetician
				redirect_to cosmetician
			else
				redirect_to root_path
			end
		end
	end
end
