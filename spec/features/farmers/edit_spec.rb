require 'rails_helper'

RSpec.describe 'the Farmer edit', type: :feature do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)

    @farmer_1 = @farm.farmers.create!(name: 'Johnny', age: 54, owns_land: true)
    @farmer_2 = @farm.farmers.create!(name: 'Moira', age: 52, owns_land: true)
    @farmer_3 = @farm.farmers.create!(name: 'Alexis', age: 34, owns_land: false)
    @farmer_4 = @farm.farmers.create!(name: 'David', age: 31, owns_land: true)
  end

  it 'can edit the farmer' do
    visit '/farmers'

    expect(page).to have_content(@farmer_1.name)
    expect(page).to have_content(@farmer_1.age)
    expect(page).to have_content(@farmer_1.owns_land)

    click_link "Edit Farmer #{@farmer_1.name}"

    fill_in 'name', with: 'Peter'
    fill_in 'age', with: 42
    page.check('owns_land')
    click_button "Edit Farmer #{@farmer_1.name}"

    expect(current_path).to eq("/farmers/#{@farmer_1.id}")
    expect(page).to have_content('Peter')
    expect(page).to have_content('42')
    expect(page).to have_content('true')
  end

  it 'links to the edit page from the farmer index page' do
    visit '/farmers'

    click_link "Edit Farmer #{@farmer_1.name}"

    expect(current_path).to eq("/farmers/#{@farmer_1.id}/edit")
  end

  it 'links to the edit page from a farmer show page' do
    visit "/farmers/#{@farmer_1.id}"

    click_link "Edit Farmer #{@farmer_1.name}"

    expect(current_path).to eq("/farmers/#{@farmer_1.id}/edit")
  end

  it 'can display a navigation bar' do
    visit "/farmers/#{@farmer_1.id}/edit"

    expect(page).to have_link('Home', :href => '/')
    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')

    visit "/farmers/#{@farmer_2.id}/edit"

    expect(page).to have_link('Home', :href => '/')
    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')
  end
end
