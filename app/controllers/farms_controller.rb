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
    farm = Farm.create(name: params[:name])
    redirect_to "/farms"
  end
end
