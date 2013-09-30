class CosmeticiansController < ApplicationController
  before_filter :signed_in_cosmetician, only: [:index,:edit,:update,:destroy]
  before_filter :correct_cosmetician, only: [:edit,:update]
  before_filter :admin_cosmetician, only: :destroy
  
  def index
	  @cosmeticians = Cosmetician.paginate(page: params[:page])
  end

  def new
	  @cosmetician = Cosmetician.new
  end

  def show
	  @cosmetician = Cosmetician.find(params[:id])
  end

  def create
	  @cosmetician = Cosmetician.new(params[:cosmetician])
	  if @cosmetician.save
		  sign_in @cosmetician
		  redirect_to @cosmetician
	  else
		  render 'new'
	  end
  end

  def edit
	  @cosmetician = Cosmetician.find(params[:id])
  end

  def update
	  @cosmetician = Cosmetician.find_by_id(params[:id])
	  if @cosmetician.update_attributes(params[:cosmetician])
		  sign_in @cosmetician
		  redirect_to @cosmetician
	  else
		  render 'edit'
	  end
  end

  def destroy
	  Cosmetician.find(params[:id]).destroy
	  redirect_to cosmeticians_url
  end

  def delete
  end

  private

  def signed_in_cosmetician
	  unless signed_in?
		  store_location
		  redirect_to signin_url,notice:"please sign in."
	  end
  end

  def correct_cosmetician
	  @cosmetician = Cosmetician.find(params[:id])
	  redirect_to(root_path) unless current_cosmetician?(@cosmetician)
  end

  def admin_cosmetician
	  redirect_to(root_path) unless current_cosmetician.admin?
  end
	
end
