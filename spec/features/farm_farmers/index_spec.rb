require 'spec_helper'

RSpec.describe 'farm to farmers index page', type: :feature do
  it 'can display a specific farms farmers' do
    farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    farmer_1 = farm.farmers.create!(name: 'Amanda', age: 30, owns_land: true)
    farmer_2 = farm.farmers.create!(name: 'Carina', age: 26, owns_land: true)
    farmer_3 = farm.farmers.create!(name: 'Jason', age: 34, owns_land: false)

    visit "/farms/#{farm.id}/farmers"

    expect(page).to have_content("#{farm.name}'s Farmers")
    expect(page).to have_content("#{farmer_1.name}")
    expect(page).to have_content("#{farmer_2.name}")
    expect(page).to have_content("#{farmer_3.name}")
  end
end
