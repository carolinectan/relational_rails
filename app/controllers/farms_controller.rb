class FarmsController < ApplicationController
  def index
    @farms = Farm.order(created_at: :desc)
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def new
  end

  def create
    farm = Farm.create!(farm_params)
    redirect_to "/farms"
  end

  def farm_params
    params.permit(:name, :has_animals, :num_of_fields)
  end
 
  def edit
  end
end
