require 'rails_helper'

RSpec.describe 'gardens index page' do
  it 'displays all garden names' do

  end

  it 'displays created at time next to garden name' do
    garden1 = Garden.create!(name: 'last garden', irrigation: true, plant_capacity: 5)
    garden2 = Garden.create!(name: 'middle garden', irrigation: false, plant_capacity: 6)
    garden3 = Garden.create!(name: 'first garden', irrigation: true, plant_capacity: 10)

    visit "/gardens"

    expect(page).to have_content(garden1.name)
    expect(page).to have_content(garden2.name)
    expect(page).to have_content(garden3.name)

    expect(page).to have_content(garden1.created_at)
    expect(page).to have_content(garden2.created_at)
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

  it 'displays a link that takes you to the garden index' do
    visit "/gardens"

    garden1 = Garden.create!(name: 'last garden', irrigation: true, plant_capacity: 5)
    garden2 = Garden.create!(name: 'middle garden', irrigation: false, plant_capacity: 6)
    garden3 = Garden.create!(name: 'first garden', irrigation: true, plant_capacity: 10)

    expect(page).to have_content('Garden Index')

    click_on('Garden Index')

    page.has_xpath?('/gardens')
  end
end
