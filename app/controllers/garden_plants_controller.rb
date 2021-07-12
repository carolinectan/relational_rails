class GardenPlantsController < ApplicationController

  def index
    if params[:sort] == 'alpha'
      @garden = Garden.find(params[:garden_id])
      @plants = @garden.plants.sort_name
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

  # def sort
  #   @alpha_sort = true
  #   @garden = Garden.find(params[:garden_id])
  #   @plants = @garden.plants.sort_name
  #
  #   redirect_to "/gardens/#{@garden.id}/plants"
  # end

  def plant_params
    params.permit(:name, :edible, :mature_height)
  end
end
