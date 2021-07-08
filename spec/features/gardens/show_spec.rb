require 'rails_helper'

RSpec.describe 'gardens show page' do

  it 'displays garden name and attributes' do

    garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)

    visit "/gardens/#{garden.id}"

    expect(page).to have_content(garden.name)
    expect(page).to have_content(garden.irrigation)
    expect(page).to have_content(garden.plant_capacity)
  end

  it 'displays the number of plants associated with the garden' do
    garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)

    plant1 = garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)
    plant2 = garden.plants.create!(name: 'rose', edible: true, mature_height: 42)

    visit "/gardens/#{garden.id}"

    expect(page).to have_content('Total Plants: 2')
  end
end
