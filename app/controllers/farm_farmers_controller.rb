class FarmFarmersController < ApplicationController
  def index
    if params[:sort] == 'alpha'
      @farm = Farm.find(params[:farm_id])
      @farmers = @farm.farmers.sort_name
      # redirect_to "/farms/#{@farm.id}/farmers?sort=alpha"
    else
      @farm = Farm.find(params[:farm_id])
      @farmers = @farm.farmers
    end
  end

# def new
#   @farm = Farm.find(params[:farm_id])
# end
#
# def create
#   farm = Farm.find(params[:farm_id])
#   farm.farmers.create!(farmer_params)
#   redirect_to "/farms/#{farm.id}/farmers"
# end
#
#   def destroy
#     farm_farmer = Farmer.find(params[:id])
#     farm_farmer.destroy
#     redirect_to '/farmers'
#   end
#
# private
#   def farmer_params
#     params.permit(:name, :age, :owns_land)
#   end
end
