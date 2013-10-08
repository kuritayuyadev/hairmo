class WantedListsController < ApplicationController
  before_filter :signed_in_cosmetician
  before_filter :correct_cosmetician, only: :destroy


  def index
  end



  def new
    @wanted_lists = WantedList.new
  end

  def show
    @wanted_lists = WantedList.find_by_id(params[:id])
	@item = current_cosmetician.wanted_lists.find_by_id(params[:id])
	@item = WantedList.find(params[:id])
	@cosmetician = current_cosmetician
  end


  def create
    @wanted_lists = current_cosmetician.wanted_lists.build(params[:wanted_list])
	cosmetician = current_cosmetician
    if @wanted_lists.save
      redirect_to cosmetician
    else
      render 'new'
    end
  end

  def edit
	  @wanted_list = WantedList.find(params[:id])
  end

  def update
	  @wanted_list = WantedList.find_by_id(params[:id])
	  if @wanted_list.update_attributes(params[:wanted_list])
		  redirect_to @wanted_list
	  else
		  render 'edit'
	  end
  end

  def destroy
	  @wanted_list.destroy
	  redirect_to root_path
  end


  private
  def correct_cosmetician
	  @wanted_list = current_cosmetician.wanted_lists.find_by_id(params[:id])
	  redirect_to root_url if @wanted_list.nil?
  end

end
