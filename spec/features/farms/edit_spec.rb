require 'rails_helper'

RSpec.describe 'the Farm edit' do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
  end

  it 'links to the edit page from the farms index page' do
    visit '/farms'

    click_link "Update #{@farm.name}"

    expect(current_path).to eq("/farms/#{@farm.id}")
  end

  it 'links to the edit page from a farm show page' do
    visit "/farms/#{@farm.id}"

    click_link "Update #{@farm.name}"

    expect(current_path).to eq("/farms/#{@farm.id}/edit")
  end

  it 'can edit the farm from a farm index page' do
    visit '/farms'

    expect(page).to have_content('Sheep Farm')

    click_link "Update #{@farm.name}"

    visit "/farms/#{@farm.id}/edit"

    fill_in 'name', with: 'Strawberry Farm'
    fill_in 'has_animals', with: false
    click_button "Update #{@farm.name}"

    expect(current_path).to eq("/farms/#{@farm.id}")
    expect(page).to have_content('Strawberry Farm')
    expect(page).to have_content('false')
  end

  it 'can edit the farm from a farm show page' do
    visit "/farms/#{@farm.id}"

    expect(page).to have_content('Sheep Farm')
    expect(page).to have_content('true')

    click_link "Update #{@farm.name}"

    visit "/farms/#{@farm.id}/edit"

    fill_in 'name', with: 'Strawberry Farm'
    fill_in 'has_animals', with: false
    click_button "Update #{@farm.name}"

    expect(current_path).to eq("/farms/#{@farm.id}")
    expect(page).to have_content('Strawberry Farm')
    expect(page).to have_content('false')
  end

  it 'can display a navigation bar' do
    visit "/farms/#{@farm.id}/edit"

    expect(page).to have_link('Home', :href => '/')
    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')
  end
end
