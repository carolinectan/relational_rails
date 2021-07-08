require 'rails_helper'

RSpec.describe 'gardens show page' do

  it 'displays garden name and attributes' do

    garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)

    visit "/gardens/#{garden.id}"

    expect(page).to have_content(garden.name)
    expect(page).to have_content(garden.irrigation)
    expect(page).to have_content(garden.plant_capacity)
  end
end
