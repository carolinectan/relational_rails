require 'rails_helper'

RSpec.describe 'the farm farmer creation' do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    @farmer_1 = @farm.farmers.create!(name: 'Amanda', age: 30, owns_land: true)
    @farmer_2 = @farm.farmers.create!(name: 'Carina', age: 26, owns_land: true)
    @farmer_3 = @farm.farmers.create!(name: 'Jason', age: 34, owns_land: false)
  end

  it 'can link to the new farmer page' do
    visit "/farms/#{@farm.id}/farmers"
save_and_open_page
    click_button("Create New Farmer")

    expect(current_path).to eq("/farms/#{@farm.id}/farmers/new")
  end

  it 'can add a new farm from the farm farmers index page' do
    visit "/farms/#{@farm.id}/farmers/new"

    fill_in('name', with: 'Penelope')
    fill_in('age', with: '27')
    fill_in('owns_land', with: 'true')

    click_button('Create New Farmer')

    expect(current_path).to eq("/farms/#{@farm.id}/farmers")
    expect(page).to have_content("Penelope")
    expect(page).to have_content("true")
    expect(page).to have_content("27")
  end
end

# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
