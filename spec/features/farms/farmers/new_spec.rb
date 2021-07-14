require 'rails_helper'

RSpec.describe 'the farm farmer creation', type: :feature do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    @farmer_1 = @farm.farmers.create!(name: 'Amanda', age: 30, owns_land: true)
    @farmer_2 = @farm.farmers.create!(name: 'Carina', age: 26, owns_land: true)
    @farmer_3 = @farm.farmers.create!(name: 'Jason', age: 34, owns_land: false)
  end

  it 'can link to the new farmer page' do
    visit "/farms/#{@farm.id}/farmers"

    click_link('Add New Farmer')

    expect(current_path).to eq("/farms/#{@farm.id}/farmers/new")
  end

  it 'can add a new farm from the farm farmers index page' do
    visit "/farms/#{@farm.id}/farmers/new"

    fill_in('name', with: 'Penelope')
    fill_in('age', with: '27')
    fill_in('owns_land', with: 'true')
    click_button('Add New Farmer')

    expect(current_path).to eq("/farms/#{@farm.id}/farmers")
    expect(page).to have_content('Penelope')
    expect(page).to have_content('true')
    expect(page).to have_content('27')
  end

  it 'can display a navigation bar' do
    visit "/farms/#{@farm.id}/farmers/new"

    expect(page).to have_link('Home', :href => '/')
    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')
  end
end
