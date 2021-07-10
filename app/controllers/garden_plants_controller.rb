class GardenPlantsController < ApplicationController

  def index
    @garden = Garden.find(params[:garden_id])
    @plants = @garden.plants
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
