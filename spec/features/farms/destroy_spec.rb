require 'rails_helper'

RSpec.describe 'destroying a farm' do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm_1 = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
    @farm_2 = Farm.create!(name: 'Corn Farm', has_animals: false, num_of_fields: 15)
    @farm_3 = Farm.create!(name: 'Alpaca Farm', has_animals: false, num_of_fields: 55)

    @farmer_1 = @farm_1.farmers.create!(name: 'Amanda', age: 30, owns_land: true)
    @farmer_2 = @farm_1.farmers.create!(name: 'Carina', age: 26, owns_land: true)
  end

  it 'can delete the farm from the index page' do
    visit "/farms/#{@farm_1.id}/farmers"

    expect(page).to have_content("#{@farmer_1.name}\nAge: #{
      @farmer_1.age}\nOwns Land: #{@farmer_1.owns_land}")
    expect(page).to have_content("#{@farmer_2.name}\nAge: #{
      @farmer_2.age}\nOwns Land: #{@farmer_2.owns_land}")

    visit "/farms"

    click_button "Delete #{@farm_1.name}"

    expect(current_path).to eq('/farms')
    expect(page).to_not have_content("#{@farm_1.name}")
    expect(page).to have_content("#{@farm_2.name}")
    expect(page).to have_content("#{@farm_3.name}")

    visit "/farmers"

    expect(page).to_not have_content("#{@farmer_1.name}\nAge: #{
      @farmer_1.age}\nOwns Land: #{@farmer_1.owns_land}")
    expect(page).to_not have_content("#{@farmer_2.name}\nAge: #{
      @farmer_2.age}\nOwns Land: #{@farmer_2.owns_land}")
  end

  it 'can delete the farm from the show page' do
    visit "/farms/#{@farm_1.id}/farmers"

    expect(page).to have_content("#{@farmer_1.name}\nAge: #{
      @farmer_1.age}\nOwns Land: #{@farmer_1.owns_land}")
    expect(page).to have_content("#{@farmer_2.name}\nAge: #{
      @farmer_2.age}\nOwns Land: #{@farmer_2.owns_land}")

    visit "/farms/#{@farm_1.id}"

    click_button "Delete #{@farm_1.name}"

    expect(current_path).to eq('/farms')
    expect(page).to_not have_content("#{@farm_1.name}")
    expect(page).to have_content("#{@farm_2.name}")
    expect(page).to have_content("#{@farm_3.name}")

    visit "/farmers"

    expect(page).to_not have_content("#{@farmer_1.name}\nAge: #{
      @farmer_1.age}\nOwns Land: #{@farmer_1.owns_land}")
    expect(page).to_not have_content("#{@farmer_2.name}\nAge: #{
      @farmer_2.age}\nOwns Land: #{@farmer_2.owns_land}")
  end
end
