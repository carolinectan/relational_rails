class GardenPlantsController < ApplicationController

  def index
    @garden = Garden.find(params[:id])
    @plants = @garden.plants
  end
end
