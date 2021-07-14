require 'rails_helper'

RSpec.describe 'the Farm Farmers edit' do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    @farmer_1 = @farm.farmers.create!(name: 'Amanda', age: 30, owns_land: true)
    @farmer_2 = @farm.farmers.create!(name: 'Carina', age: 26, owns_land: true)
    @farmer_3 = @farm.farmers.create!(name: 'Jason', age: 34, owns_land: false)
  end

  it 'can link to the farmer edit page from the farm farmer index page' do
    visit "/farms/#{@farm.id}/farmers"

    click_link "Edit Farmer #{@farmer_1.name}"

    expect(current_path).to eq("/farmers/#{@farmer_1.id}/edit")
  end
end
