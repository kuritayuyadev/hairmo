class WantedListsController < ApplicationController
  before_filter :signed_in_cosmetician
  before_filter :correct_cosmetician, only: :destroy


  def index
  end



  def new
    @wanted_lists = WantedList.new
  end

  def show
    @wanted_lists = WantedList.find(params[:id])
	@item = WantedList.find(params[:id])
	@cosmetician = current_cosmetician
  end


  def create
    @wanted_lists = current_cosmetician.wanted_lists.build(params[:wanted_list])
    if @wanted_lists.save
      render 'show'
    else
      render 'new'
    end
  end

  def edit
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
