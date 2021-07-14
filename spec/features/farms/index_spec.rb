require 'rails_helper'

RSpec.describe 'farms index page', type: :feature do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm_1 = Farm.create!(name: '1 Sheep Farm', has_animals: true, num_of_fields: 8)
    @farm_2 = Farm.create!(name: '2 Corn Farm', has_animals: false, num_of_fields: 15)
    @farm_3 = Farm.create!(name: '3 Alpaca Farm', has_animals: false, num_of_fields: 55)
  end

  it 'can display all farms' do
    visit '/farms'

    expect(page).to have_content(@farm_1.name)
    expect(page).to have_content(@farm_2.name)
  end

  it 'can display all farms in order by most recently created' do
    visit '/farms'

    expect(page).to have_content("#{@farm_3.name}\n(#{@farm_3.created_at
      })\nEdit #{@farm_3.name} Delete #{@farm_3.name}\n#{@farm_2.name
      }\n(#{@farm_2.created_at})\nEdit #{@farm_2.name} Delete #{@farm_2.name
      }\n#{@farm_1.name}\n(#{@farm_1.created_at})\nEdit #{@farm_1.name
      } Delete #{@farm_1.name}")
  end

  it 'can display a navigation bar' do
    visit '/farms'

    expect(page).to have_link('Home', :href => '/')
    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')
  end
end
