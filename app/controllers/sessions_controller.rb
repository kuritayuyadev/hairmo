class SessionsController < ApplicationController

	def new 
	end

	def create
		cosmetician = Cosmetician.find_by_email(params[:session][:email].downcase)
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

end
