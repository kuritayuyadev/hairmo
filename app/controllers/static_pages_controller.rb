class StaticPagesController < ApplicationController
  def home
	  #@wanted_lists = WantedList.paginate(page: params[:page])
  end

  def help
  end

  def contact
  end

  def about
  end
end
