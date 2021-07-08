require 'rails_helper'

RSpec.describe 'plants show page' do
  it 'displays plant name and attributes' do
    garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)
    plant1 = garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)

    visit "/plants/#{plant1.id}"

    expect(page).to have_content(plant1.name)
    expect(page).to have_content(plant1.edible)
    expect(page).to have_content(plant1.mature_height)
  end

  it 'does not display other plants or their attributes' do
    garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)

    plant1 = garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)
    plant2 = garden.plants.create!(name: 'rose', edible: true, mature_height: 42)

    visit "/plants/#{plant1.id}"

    expect(page).to have_content(plant1.name)
    expect(page).to_not have_content(plant2.name)
    expect(page).to_not have_content(plant2.edible)
    expect(page).to_not have_content(plant2.mature_height)
  end

  it 'displays a link that takes you to the plant index' do
    visit "/gardens"

    garden1 = Garden.create!(name: 'last garden', irrigation: true, plant_capacity: 5)
    garden2 = Garden.create!(name: 'middle garden', irrigation: false, plant_capacity: 6)
    garden3 = Garden.create!(name: 'first garden', irrigation: true, plant_capacity: 10)

    expect(page).to have_content('Plant Index')

    click_on('Plant Index')

    page.has_xpath?('/plants')
  end
end
