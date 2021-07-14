class GardenPlantsController < ApplicationController

  def index
    if params[:sort] == 'alpha'
      @garden = Garden.find(params[:garden_id])
      @plants = @garden.plants.sort_name
    elsif params[:number] != nil
      @garden = Garden.find(params[:garden_id])
      @plants = @garden.plants.where("mature_height > #{params[:number]}")
    else
      @garden = Garden.find(params[:garden_id])
      @plants = @garden.plants
    end
  end

  def new
    @garden = Garden.find(params[:garden_id])
  end

  def create
    garden = Garden.find(params[:garden_id])
    garden.plants.create!(plant_params)

    redirect_to "/gardens/#{garden.id}/plants"
  end

  def plant_params
    params.permit(:name, :edible, :mature_height)
  end
end
