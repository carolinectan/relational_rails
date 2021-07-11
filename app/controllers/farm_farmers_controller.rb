class FarmFarmersController < ApplicationController
  def index
    @farm = Farm.find(params[:id])
    @farmers = @farm.farmers
  end

  def destroy
    farm_farmer = Farmer.find(params[:id])
    farm_farmer.destroy
    redirect_to '/farmers'
  end
end
