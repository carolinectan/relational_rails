require 'spec_helper'

RSpec.describe 'farm to farmers index page', type: :feature do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm_1 = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
    @farm_2 = Farm.create!(name: 'Corn Farm', has_animals: false, num_of_fields: 47)

    @farmer_1 = @farm_1.farmers.create!(name: 'Samanta', age: 57, owns_land: true)
    @farmer_2 = @farm_1.farmers.create!(name: 'Peter', age: 22, owns_land: true)
    @farmer_3 = @farm_1.farmers.create!(name: 'Jesse', age: 45, owns_land: false)

    @farmer_4 = @farm_2.farmers.create!(name: 'Mark', age: 74, owns_land: true)
    @farmer_5 = @farm_2.farmers.create!(name: 'Amanda', age: 30, owns_land: true)
    @farmer_6 = @farm_2.farmers.create!(name: 'Carina', age: 26, owns_land: true)
    @farmer_7 = @farm_2.farmers.create!(name: 'Jason', age: 34, owns_land: false)
  end

  it 'can display records over a given threshold' do
    visit "/farms/#{@farm_2.id}/farmers"

    expect(page).to have_content("#{@farmer_4.name}\nAge: #{@farmer_4.age
      }\nOwns Land: #{@farmer_4.owns_land}")
    expect(page).to have_content("#{@farmer_5.name}\nAge: #{@farmer_5.age
      }\nOwns Land: #{@farmer_5.owns_land}")
    expect(page).to have_content("#{@farmer_6.name}\nAge: #{@farmer_6.age
      }\nOwns Land: #{@farmer_6.owns_land}")
    expect(page).to have_content("#{@farmer_7.name}\nAge: #{@farmer_7.age
      }\nOwns Land: #{@farmer_7.owns_land}")

    fill_in('number', with: 30)
    click_button('Only return records that are over the age submitted')

    expect(current_path).to eq("/farms/#{@farm_2.id}/farmers")
    expect(page).to have_content("#{@farmer_4.name}\nAge: #{@farmer_4.age
      }\nOwns Land: #{@farmer_4.owns_land}")
    expect(page).to have_content("#{@farmer_7.name}\nAge: #{@farmer_7.age
      }\nOwns Land: #{@farmer_7.owns_land}")
    expect(page).to_not have_content("#{@farmer_5.name}\nAge: #{@farmer_5.age
      }\nOwns Land: #{@farmer_5.owns_land}")
    expect(page).to_not have_content("#{@farmer_6.name}\nAge: #{@farmer_6.age
      }\nOwns Land: #{@farmer_6.owns_land}")
  end

  it 'can display all farmers of a specific farm' do
    visit "/farms/#{@farm_1.id}/farmers"

    expect(page).to have_content("#{@farm_1.name}")
    expect(page).to have_content("#{@farmer_1.name}")
    expect(page).to have_content("#{@farmer_2.name}")
    expect(page).to have_content("#{@farmer_3.name}")

    visit "/farms/#{@farm_2.id}/farmers"

    expect(page).to have_content("#{@farm_2.name}")
    expect(page).to have_content("#{@farmer_4.name}")
    expect(page).to have_content("#{@farmer_5.name}")
    expect(page).to have_content("#{@farmer_6.name}")
    expect(page).to have_content("#{@farmer_7.name}")
  end

   it "can display all farmers' attributes" do
    visit "/farms/#{@farm_1.id}/farmers"

    expect(page).to have_content("#{@farmer_1.name}\nAge: #{@farmer_1.age
      }\nOwns Land: #{@farmer_1.owns_land}")
    expect(page).to have_content("#{@farmer_2.name}\nAge: #{@farmer_2.age
      }\nOwns Land: #{@farmer_2.owns_land}")
    expect(page).to have_content("#{@farmer_3.name}\nAge: #{@farmer_3.age
      }\nOwns Land: #{@farmer_3.owns_land}")

    visit "/farms/#{@farm_2.id}/farmers"

    expect(page).to have_content("#{@farmer_4.name}\nAge: #{@farmer_4.age
      }\nOwns Land: #{@farmer_4.owns_land}")
    expect(page).to have_content("#{@farmer_5.name}\nAge: #{@farmer_5.age
      }\nOwns Land: #{@farmer_5.owns_land}")
    expect(page).to have_content("#{@farmer_6.name}\nAge: #{@farmer_6.age
      }\nOwns Land: #{@farmer_6.owns_land}")
    expect(page).to have_content("#{@farmer_7.name}\nAge: #{@farmer_7.age
      }\nOwns Land: #{@farmer_7.owns_land}")
  end

  it 'can display a navigation bar' do
    visit "/farms/#{@farm_1.id}/farmers"

    expect(page).to have_link('Home', :href => '/')
    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')

    visit "/farms/#{@farm_2.id}/farmers"

    expect(page).to have_link('Home', :href => '/')
    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')
  end

  it 'can sort farm farmers in alphabetical order by name' do
    visit "/farms/#{@farm_1.id}/farmers"

    click_link('Sort by Name')

    expect(current_path).to eq("/farms/#{@farm_1.id}/farmers")
    # expect(current_path).to eq("/farms/#{@farm_1.id}/farmers/?sort=alpha")
    expect(page).to have_content("#{@farmer_3.name}\nAge: #{@farmer_3.age
      }\nOwns Land: #{@farmer_3.owns_land}\nEdit Farmer #{@farmer_3.name
      } Delete Farmer #{@farmer_3.name}\n#{@farmer_2.name}\nAge: #{
      @farmer_2.age}\nOwns Land: #{@farmer_2.owns_land}\nEdit Farmer #{
      @farmer_2.name} Delete Farmer #{@farmer_2.name}\n#{@farmer_1.name
      }\nAge: #{@farmer_1.age}\nOwns Land: #{@farmer_1.owns_land
      }\nEdit Farmer #{@farmer_1.name} Delete Farmer #{@farmer_1.name}")

    visit "/farms/#{@farm_2.id}/farmers"

    click_link('Sort by Name')

    expect(current_path).to eq("/farms/#{@farm_2.id}/farmers")
    # expect(current_path).to eq("/farms/#{@farm_2.id}/farmers/?sort=alpha")
    expect(page).to have_content("#{@farmer_5.name}\nAge: #{@farmer_5.age
      }\nOwns Land: #{@farmer_5.owns_land}\nEdit Farmer #{@farmer_5.name
      } Delete Farmer #{@farmer_5.name}\n#{@farmer_6.name}\nAge: #{
      @farmer_6.age}\nOwns Land: #{@farmer_6.owns_land}\nEdit Farmer #{
      @farmer_6.name} Delete Farmer #{@farmer_6.name}\n#{@farmer_7.name
      }\nAge: #{@farmer_7.age}\nOwns Land: #{@farmer_7.owns_land
      }\nEdit Farmer #{@farmer_7.name} Delete Farmer #{@farmer_7.name}\n#{
      @farmer_4.name}\nAge: #{@farmer_4.age}\nOwns Land: #{@farmer_4.owns_land
      }\nEdit Farmer #{@farmer_4.name} Delete Farmer #{@farmer_4.name}")
  end

  it 'can link to create a new farmer' do
    visit "/farms/#{@farm_1.id}/farmers"

    click_link('Create New Farmer')

    expect(current_path).to eq("/farms/#{@farm_1.id}/farmers/new")
  end

  it 'can delete a new farmer' do
    visit "/farms/#{@farm_1.id}/farmers"

    expect(page).to have_content("#{@farmer_1.name}")

    click_link("Delete Farmer #{@farmer_1.name}")

    expect(current_path).to eq("/farmers")
    expect(page).to_not have_content("#{@farmer_1.name}")
  end
end
