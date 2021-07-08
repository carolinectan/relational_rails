require 'rails_helper'

RSpec.describe 'farms index page', type: :feature do
  it 'can display all farms' do
    farm_1 = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
    farm_2 = Farm.create!(name: 'Corn Farm', has_animals: false, num_of_fields: 15)

    visit '/farms'

    expect(page).to have_content(farm_1.name)
    expect(page).to have_content(farm_2.name)
  end
end
