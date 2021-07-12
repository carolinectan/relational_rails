require 'rails_helper'

RSpec.describe 'farmers index page', type: :feature do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
    
    @farmer_1 = @farm.farmers.create!(name: 'Amanda', age: 30, owns_land: true)
    @farmer_2 = @farm.farmers.create!(name: 'Carina', age: 26, owns_land: true)
    @farmer_3 = @farm.farmers.create!(name: 'Jason', age: 34, owns_land: false)
  end

  it 'can display a farmers and its attributes' do
    visit '/farmers'

    expect(page).to have_content(@farmer_1.name)
    expect(page).to have_content(@farmer_2.name)
    expect(page).to have_content(@farmer_3.name)
  end
end
