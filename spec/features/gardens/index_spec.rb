require 'rails_helper'

RSpec.describe 'gardens index page' do
  before(:each) do
    @garden1 = Garden.create!(name: 'last garden', irrigation: true, plant_capacity: 5)
    @garden2 = Garden.create!(name: 'middle garden', irrigation: false, plant_capacity: 6)
    @garden3 = Garden.create!(name: 'first garden', irrigation: true, plant_capacity: 10)
  end

  describe 'display' do
    it 'displays all garden names' do
      visit '/gardens'

      expect(page).to have_content(@garden1.name)
      expect(page).to have_content(@garden2.name)
      expect(page).to have_content(@garden3.name)
    end

    it 'displays created at time next to garden name' do
      visit '/gardens'

      expect(page).to have_content(@garden1.created_at)
      expect(page).to have_content(@garden2.created_at)
      expect(page).to have_content(@garden3.created_at)
    end
  end

  describe 'delete' do
    it 'can delete an instance of a garden' do
      visit '/gardens'

      click_on "Delete #{@garden2.name}"
      expect(current_path).to eq('/gardens')

      expect(page).to_not have_content(@garden2.name)
    end
  end

  describe 'links' do
    it 'takes you to the plant index' do
      visit '/gardens'

      click_on('Plant Index')
      expect(current_path).to eq('/plants')
    end

    it 'takes you to the garden index' do
      visit '/gardens'

      click_on('Garden Index')
      expect(current_path).to eq('/gardens')
    end

    it 'takes you to a new parent form' do
      visit '/gardens'

      click_on('Add New Garden')
      expect(current_path).to eq('/gardens/new')
    end

    it 'takes you to edit a garden' do
      visit '/gardens'

      click_on("Edit #{@garden1.name}")
      expect(current_path).to eq("/gardens/#{@garden1.id}/edit")
    end
  end
end
