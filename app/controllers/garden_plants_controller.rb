class GardenPlantsController < ApplicationController

  def index
    @garden = Garden.find(params[:garden_id])
    @plants = @garden.plants
  end
end
