require 'rails_helper'

RSpec.describe 'gardens show page' do
  before(:each) do
    @garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)

    @plant1 = @garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)
    @plant2 = @garden.plants.create!(name: 'rose', edible: true, mature_height: 42)
  end
  it 'displays garden name and attributes' do
    visit "/gardens/#{@garden.id}"

    expect(page).to have_content(@garden.name)
    expect(page).to have_content(@garden.irrigation)
    expect(page).to have_content(@garden.plant_capacity)
  end

  it 'displays the number of plants associated with the garden' do
    visit "/gardens/#{@garden.id}"

    expect(page).to have_content('Total Plants: 2')
  end

  it 'displays a link that takes you to the plant index' do
    visit "/gardens/#{@garden.id}"

    expect(page).to have_content('Plant Index')

    click_on('Plant Index')

    page.has_xpath?('/plants')
  end

  it 'displays a link that takes you to the garden index' do
    visit "/gardens/#{@garden.id}"

    expect(page).to have_content('Garden Index')

    click_on('Garden Index')

    page.has_xpath?('/gardens')
  end
end
