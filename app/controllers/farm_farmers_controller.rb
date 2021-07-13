class FarmFarmersController < ApplicationController
  def index
    if params[:sort] == 'alpha'
      @farm = Farm.find(params[:farm_id])
      @farmers = @farm.farmers.sort_name
    elsif params[:number] != nil
      @farm = Farm.find(params[:farm_id])
      @farmers = @farm.farmers.where("age > #{params[:number]}")
    else
      @farm = Farm.find(params[:farm_id])
      @farmers = @farm.farmers
    end
  end
end
