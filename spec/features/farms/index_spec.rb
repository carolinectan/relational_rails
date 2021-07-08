require 'rails_helper'

RSpec.describe 'farms index page', type: :feature do
  it 'can display all farms' do
    farm_1 = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
    farm_2 = Farm.create!(name: 'Corn Farm', has_animals: false, num_of_fields: 15)

    visit '/farms'
    # Then I see the name of each parent record in the system
    expect(page).to have_content(farm_1.name)
    expect(page).to have_content(farm_2.name)
  end

  it 'can display a specific farm and its attributes' do
    farm_1 = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
    farm_2 = Farm.create!(name: 'Corn Farm', has_animals: false, num_of_fields: 15)

    visit "/farms/#{farm_1.id}"
    # Then I see the farm with that id including the parent's attributes:
    # - data from each column that is on the parent table
    expect(page).to have_content(farm_1.name)
    expect(page).to have_content("Has Animals: #{farm_1.has_animals}")
    expect(page).to have_content("Number of Fields: #{farm_1.num_of_fields}")

    visit "/farms/#{farm_2.id}"
    expect(page).to have_content(farm_2.name)
    expect(page).to have_content("Has Animals: #{farm_2.has_animals}")
    expect(page).to have_content("Number of Fields: #{farm_2.num_of_fields}")
  end
end
