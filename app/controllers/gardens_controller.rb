class GardensController < ApplicationController
  def index
    @gardens = Garden.sort_descending
  end

  def show
    @garden = Garden.find(params[:id])
    @count = @garden.plant_count
  end
end
