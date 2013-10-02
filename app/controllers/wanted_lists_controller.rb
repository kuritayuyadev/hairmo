class WantedListsController < ApplicationController


  def new
    @wantedlist = Wantedlist.new
  end

  def show
    @cosmetician = Cosmetician.find(params[:id])
  end


  def create
    @wantedlist = Wantedlist.new(params[:wantedlist])
    if @wantedlist.save
      render 'show' 
    else
      render 'new'
    end
  end

  def edit
  end

  def delete
  end
end
