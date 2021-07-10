require 'rails_helper'

RSpec.describe 'the Farm edit' do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
  end

  it 'links to the edit page' do
    visit "/farms/#{@farm.id}"

    click_button "Update #{@farm.name}"

    expect(current_path).to eq("/farms/#{@farm.id}/edit")
  end

  it 'can edit the farm' do
    visit "/farms/#{@farm.id}"

    expect(page).to have_content('Sheep Farm')
    expect(page).to have_content('true')

    click_button 'Update Sheep Farm'

    visit "/farms/#{@farm.id}/edit"

    fill_in 'name', with: 'Strawberry Farm'
    fill_in 'has_animals', with: false
    click_button "Update #{@farm.name}"

    expect(current_path).to eq("/farms/#{@farm.id}")
    expect(page).to have_content('Strawberry Farm')
    expect(page).to have_content('false')
  end
end
