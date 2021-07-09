require 'rails_helper'

RSpec.describe 'farms index page', type: :feature do
  it 'can display all farms' do
    farm_1 = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
    farm_2 = Farm.create!(name: 'Corn Farm', has_animals: false, num_of_fields: 15)

    visit '/farms'

    expect(page).to have_content(farm_1.name)
    expect(page).to have_content(farm_2.name)
  end

  it 'can display all farms in order by most recently created' do
    farm_1 = Farm.create!(name: '1 Sheep Farm', has_animals: true, num_of_fields: 8)
    farm_2 = Farm.create!(name: '2 Corn Farm', has_animals: false, num_of_fields: 15)
    farm_3 = Farm.create!(name: '3 Alpaca Farm', has_animals: false, num_of_fields: 55)

    visit '/farms'

    expect(page).to have_content("#{farm_3.name}\n#{farm_2.name}\n#{farm_1.name}")
  end

  it 'can display a navigation bar' do
    farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    visit '/farms'

    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plants Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')
  end
end
