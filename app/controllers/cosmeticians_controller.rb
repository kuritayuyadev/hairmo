class CosmeticiansController < ApplicationController
  def new
    @cosmetician = Cosmetician.new
  end

  def show
    @cosmetician = Cosmetician.find(params[:id])
    @wantedlists = @cosmetician.wantedlists.paginate(page:params[:page])

  end

  def create
    @cosmetician = Cosmetician.new(params[:cosmetician])
    if @cosmetician.save
      redirect_to @cosmetician
    else
      render 'new'
    end
  end

  def edit
  end

  def delete
  end
end
