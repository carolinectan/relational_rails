require 'rails_helper'

RSpec.describe 'farm show page', type: :feature do
  it 'can display a specific farm and its attributes' do
    farm_1 = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
    farm_2 = Farm.create!(name: 'Corn Farm', has_animals: false, num_of_fields: 15)

    visit "/farms/#{farm_1.id}"

    expect(page).to have_content(farm_1.name)
    expect(page).to have_content("Has Animals: #{farm_1.has_animals}")
    expect(page).to have_content("Number of Fields: #{farm_1.num_of_fields}")

    visit "/farms/#{farm_2.id}"

    expect(page).to have_content(farm_2.name)
    expect(page).to have_content("Has Animals: #{farm_2.has_animals}")
    expect(page).to have_content("Number of Fields: #{farm_2.num_of_fields}")
  end

  it 'can display the number of children associated with a specific parent' do
    farm_1 = Farm.create!(name: 'Carrot Farm', has_animals: false, num_of_fields: 8)
    farm_2 = Farm.create!(name: 'Fish Farm', has_animals: true, num_of_fields: 15)

    farm_1.farmers.create!(name: 'Sami', age: 35, owns_land: true)
    farm_2.farmers.create!(name: 'Carina', age: 28, owns_land: true)
    farm_2.farmers.create!(name: 'Scott', age: 37, owns_land: false)

    visit "/farms/#{farm_1.id}"

    expect(page).to have_content("Number of Farmers: #{farm_1.farmers.count}")

    visit "/farms/#{farm_2.id}"

    expect(page).to have_content("Number of Farmers: #{farm_2.farmers.count}")
  end

  it 'can display a navigation bar' do
    farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    visit "/farms/#{farm.id}"

    expect(page).to have_link("Farm Index", :href => "/farms")
    expect(page).to have_link("Farmer Index", :href => "/farmers")
    expect(page).to have_link("Plants Index", :href => "/plants")
    expect(page).to have_link("Garden Index", :href => "/gardens")
  end
end
