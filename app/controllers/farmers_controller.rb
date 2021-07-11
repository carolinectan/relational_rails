class FarmersController < ApplicationController
  def index
    @farmers = Farmer.all
  end

  def show
    @farmer = Farmer.find(params[:id])
  end

  def destroy
    farmer = Farmer.find(params[:id])
    farmer.destroy
    redirect_to '/farmers'
  end
end
