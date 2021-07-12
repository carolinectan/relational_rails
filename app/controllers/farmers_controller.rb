class FarmersController < ApplicationController
  def index
    @farmers = Farmer.all
  end

  def new
    @farm = Farm.find(params[:farm_id])
  end

  def create
    farm = Farm.find(params[:farm_id])
    farmer = farm.farmers.create!(farmer_params)
    redirect_to "/farms/#{farm.id}/farmers"
  end

  def show
    @farmer = Farmer.find(params[:id])
  end

  def edit
    @farmer = Farmer.find(params[:id])
  end

  def update
    farmer = Farmer.find(params[:id])
    farmer.update(farmer_params)
    redirect_to "/farmers/#{farmer.id}"
  end

  def destroy
    farmer = Farmer.find(params[:id])
    farmer.destroy
    redirect_to '/farmers'
  end

private
  def farmer_params
    params.permit(:name, :age, :owns_land)
  end
end
