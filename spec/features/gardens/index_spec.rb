require 'rails_helper'

RSpec.describe 'gardens index page' do
  before(:each) do
    @garden1 = Garden.create!(name: 'last garden', irrigation: true, plant_capacity: 5)
    @garden2 = Garden.create!(name: 'middle garden', irrigation: false, plant_capacity: 6)
    @garden3 = Garden.create!(name: 'first garden', irrigation: true, plant_capacity: 10)
  end

  it 'displays all garden names' do
    visit "/gardens"

    expect(page).to have_content(@garden1.name)
    expect(page).to have_content(@garden2.name)
    expect(page).to have_content(@garden3.name)
  end

  it 'displays created at time next to garden name' do
    visit "/gardens"

    expect(page).to have_content(@garden1.created_at)
    expect(page).to have_content(@garden2.created_at)
    expect(page).to have_content(@garden3.created_at)
  end

  describe "links" do
    it 'takes you to the plant index' do
      visit "/gardens"

      expect(page).to have_content('Plant Index')

      click_on('Plant Index')

      page.has_xpath?('/plants')
    end

    it 'takes you to the garden index' do
      visit "/gardens"

      expect(page).to have_content('Garden Index')

      click_on('Garden Index')

      page.has_xpath?('/gardens')
    end

    it 'takes you to a new parent form' do
      visit "/gardens"

      click_button('Add New Garden')
      expect(current_path).to eq('/gardens/new')
    end
  end
end
