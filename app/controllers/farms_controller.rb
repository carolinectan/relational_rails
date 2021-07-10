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
    farm = Farm.create!(name: params[:name], has_animals: params[:has_animals], num_of_fields: params[:num_of_fields])
    redirect_to "/farms"
  end
end
