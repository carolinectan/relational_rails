class PlantsController < ApplicationController
  def index
    @plants = Plant.edible_filter
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    plant = Plant.find(params[:id])
    plant.update(plant_params)

    redirect_to "/plants/#{plant.id}"
  end

  def plant_params
    params.permit(:name, :edible, :mature_height)
  end
end
