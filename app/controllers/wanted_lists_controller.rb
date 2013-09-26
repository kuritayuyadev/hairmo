class WantedListsController < ApplicationController


  def new
    @wantedlist = Wantedlist.new
  end

  def show
    @wantedlist = Wantedlist.find(params[:id])
  end


  def create
    @wantedlist = wantedlist.new(params[:wantedlist])
    if @wantedlist.save
      redirect_to @wantedlist
    else
      render 'new'
    end
  end

  def edit
  end

  def delete
  end
end
