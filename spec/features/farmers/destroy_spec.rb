require 'rails_helper'

RSpec.describe 'destroying a farmer' do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    @farmer_1 = @farm.farmers.create!(name: 'Amanda', age: 30, owns_land: true)
    @farmer_2 = @farm.farmers.create!(name: 'Carina', age: 26, owns_land: true)
    @farmer_3 = @farm.farmers.create!(name: 'Jason', age: 34, owns_land: false)
  end

  it 'can delete the farmer from the index page' do
    visit "/farmers"

    expect(page).to have_content(@farmer_1.name)
    expect(page).to have_content(@farmer_2.name)
    expect(page).to have_content(@farmer_3.name)

    click_button "Delete Farmer #{@farmer_1.name}"

    expect(current_path).to eq('/farmers')
    expect(page).to_not have_content(@farmer_1.name)
    expect(page).to have_content(@farmer_2.name)
    expect(page).to have_content(@farmer_3.name)
  end

  it 'can delete the farmer from the farm farmer page' do
    visit "/farms/#{@farm.id}/farmers"

    expect(page).to have_content("#{@farmer_1.name}\nAge: #{
      @farmer_1.age}\nOwns Land: #{@farmer_1.owns_land}")
    expect(page).to have_content("#{@farmer_2.name}\nAge: #{
      @farmer_2.age}\nOwns Land: #{@farmer_2.owns_land}")
    expect(page).to have_content("#{@farmer_3.name}\nAge: #{
      @farmer_3.age}\nOwns Land: #{@farmer_3.owns_land}")

    click_button "Delete Farmer #{@farmer_1.name}"

    expect(current_path).to eq('/farmers')
    expect(page).to_not have_content("#{@farmer_1.name}\nAge: #{
      @farmer_1.age}\nOwns Land: #{@farmer_1.owns_land}")
    expect(page).to have_content("#{@farmer_2.name}\nAge: #{
      @farmer_2.age}\nOwns Land: #{@farmer_2.owns_land}")
    expect(page).to have_content("#{@farmer_3.name}\nAge: #{
      @farmer_3.age}\nOwns Land: #{@farmer_3.owns_land}")
  end

end
