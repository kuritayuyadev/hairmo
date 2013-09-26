class WantedListsController < ApplicationController


  def new
    @wantedlist = Wantedlist.all
  end

  def show
    @wantedlist = Wantedlist.all
  end

  def edit
  end

  def delete
  end
end
