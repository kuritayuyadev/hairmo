class CosmeticiansController < ApplicationController
  def new
    @cosmetician = Cosmetician.all
  end

  def show
    @cosmetician = Cosmetician.find(params[:id])
  end

  def edit
  end

  def delete
  end
end
