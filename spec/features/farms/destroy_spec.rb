require 'rails_helper'

RSpec.describe 'destroying a farm' do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm_1 = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
    @farm_2 = Farm.create!(name: 'Corn Farm', has_animals: false, num_of_fields: 15)
    @farm_3 = Farm.create!(name: 'Alpaca Farm', has_animals: false, num_of_fields: 55)
  end

  it 'can delete the farm from the index page' do
    visit "/farms"

    click_button "Delete #{@farm_1.name}"

    expect(current_path).to eq('/farms')
    expect(page).to_not have_content("#{@farm_1.name}")
    expect(page).to have_content("#{@farm_2.name}")
    expect(page).to have_content("#{@farm_3.name}")
  end

  it 'can delete the farm from the show page' do
    visit "/farms/#{@farm_1.id}"

    click_button "Delete #{@farm_1.name}"

    expect(current_path).to eq('/farms')
    expect(page).to_not have_content("#{@farm_1.name}")
    expect(page).to have_content("#{@farm_2.name}")
    expect(page).to have_content("#{@farm_3.name}")
  end
end
