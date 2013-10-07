class CosmeticiansController < ApplicationController
  before_filter :signed_in_cosmetician, only: [:index,:edit,:update,:destroy]
  before_filter :correct_cosmetician, only: [:edit,:update]
  before_filter :admin_cosmetician, only: :destroy

  def index
    @cosmeticians = Cosmetician.paginate(page: params[:page])
  end

  def all_cosmeticians
    @cosmeticians = Cosmetician.paginate(page: params[:page])
  end

  def new
    @cosmetician = Cosmetician.new
  end

  def show
    @cosmetician = current_cosmetician
	#@wanted_list = current_cosmetician.wanted_lists.build if signed_in?
	#@wanted_lists = @cosmetician.wanted_lists.paginate(page:params[:page])
	@wanted_list = current_cosmetician.wanted_lists.find_by_id(params[:id])
	@feed_items = current_cosmetician.feed.paginate(page:params[:page])
  end

  def create
    #facebook ?
    #auth = request.env["omniauth.auth"]
    @cosmetician = Cosmetician.new(params[:cosmetician]) #|| Cosmetician.create_with_omniauth(auth)
    if @cosmetician.save
      sign_in @cosmetician
      redirect_to @cosmetician
    else
      render 'new'
    end
    @cosmetician = Cosmetician.all
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


  def correct_cosmetician
    @cosmetician = Cosmetician.find(params[:id])
    redirect_to(root_path) unless current_cosmetician?(@cosmetician)
  end

  def admin_cosmetician
    redirect_to(root_path) unless current_cosmetician.admin?
  end

end
