class GardensController < ApplicationController
  def index
    @gardens = Garden.sort_descending
  end

  def show
    @garden = Garden.find(params[:id])
    @count = @garden.plant_count
  end

  def new
  end

  def create
    Garden.create!(garden_params)

    redirect_to "/gardens"
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    garden = Garden.find(params[:id])
    garden.update(garden_params)

    redirect_to "/gardens/#{garden.id}"
  end

  def garden_params
    params.permit(:name, :irrigation, :plant_capacity)
  end
end
