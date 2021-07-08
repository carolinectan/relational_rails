class GardensController < ApplicationController
  def index
    @gardens = Garden.order('created_at DESC')
  end

  def show
    @garden = Garden.find(params[:id])
    @count = @garden.plant_count
  end
end
