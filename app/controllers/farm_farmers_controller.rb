class FarmFarmersController < ApplicationController
  def index
    @farm = Farm.find(params[:id])
    @farmers = @farm.farmers
  end
end
