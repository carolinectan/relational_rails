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
  
    expect(page).to have_content("#{@farmer_1.name}\nAge: #{@farmer_1.age}\nOwns Land: #{@farmer_1.owns_land}")
    expect(page).to have_content("#{@farmer_2.name}\nAge: #{@farmer_2.age}\nOwns Land: #{@farmer_2.owns_land}")
    expect(page).to have_content("#{@farmer_3.name}\nAge: #{@farmer_3.age}\nOwns Land: #{@farmer_3.owns_land}")
  end

  xit 'can dispaly farmers ONLY if owns_land == true' do
    visit '/farmers'

    expect(page).to have_content()
    # Then I only see records where the boolean column is `true`
  end

end
