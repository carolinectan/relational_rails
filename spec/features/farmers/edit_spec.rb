require 'rails_helper'

RSpec.describe 'the Farmer edit' do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    @farmer_1 = @farm.farmers.create!(name: 'Johnny', age: 54, owns_land: false)
    @farmer_2 = @farm.farmers.create!(name: 'Moira', age: 52, owns_land: true)
    @farmer_3 = @farm.farmers.create!(name: 'Alexis', age: 34, owns_land: false)
    @farmer_4 = @farm.farmers.create!(name: 'David', age: 31, owns_land: true)
  end

  it 'links to the edit page from a farmer show page' do
    visit "/farmers/#{@farmer_1.id}"

    click_button "Update Farmer #{@farmer_1.name}"

    expect(current_path).to eq("/farmers/#{@farmer_1.id}/edit")
  end
end