class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  helper_method :current_cosmetician

  def handle_unverified_request
	  sign_out
	  super
  end

end
