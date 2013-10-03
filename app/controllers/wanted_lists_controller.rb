class WantedListsController < ApplicationController


  def index

  end



  def new
    @wantedlists = Wantedlist.new
  end

  def show
    @wantedlists = Wantedlist.find(params[:id])
  end


  def create
    @wantedlists = Wantedlist.new(params[:wantedlist])
    if @wantedlists.save
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
