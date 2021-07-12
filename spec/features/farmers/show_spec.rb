require 'rails_helper'

RSpec.describe 'farmers index page', type: :feature do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    @farmer_1 = @farm.farmers.create!(name: 'Amanda', age: 30, owns_land: true)
    @farmer_2 = @farm.farmers.create!(name: 'Carina', age: 26, owns_land: false)
  end

  it 'can display a specific farmer and its attributes' do
    visit "/farmers/#{@farmer_1.id}"

    expect(page).to have_content(@farmer_1.name)
    expect(page).to have_content("Age: #{@farmer_1.age}")
    expect(page).to have_content("Owns Land: #{@farmer_1.owns_land}")

    visit "/farmers/#{@farmer_2.id}"

    expect(page).to have_content(@farmer_2.name)
    expect(page).to have_content("Age: #{@farmer_2.age}")
    expect(page).to have_content("Owns Land: #{@farmer_2.owns_land}")
  end

  it 'can display a navigation bar' do
    visit "/farmers/#{@farmer_2.id}"

    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')
  end
end
