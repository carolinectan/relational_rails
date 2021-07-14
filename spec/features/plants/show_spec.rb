require 'rails_helper'

RSpec.describe 'plants show page' do
  before (:each) do
    @garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)
    @plant1 = @garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)
    @plant2 = @garden.plants.create!(name: 'rose', edible: true, mature_height: 42)
  end

  describe 'display' do
    it 'displays plant name and attributes' do
      visit "/plants/#{@plant1.id}"

      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant1.edible)
      expect(page).to have_content(@plant1.mature_height)
    end

    it 'does not display other plants or their attributes' do
      visit "/plants/#{@plant1.id}"

      expect(page).to_not have_content(@plant2.name)
      expect(page).to_not have_content(@plant2.edible)
      expect(page).to_not have_content(@plant2.mature_height)
    end
  end

  describe 'delete' do
    it 'can delete an instance of a plant' do
      visit "/plants/#{@plant1.id}"

      expect(page).to have_content(@plant1.name)

      click_on 'Delete Plant'
      expect(current_path).to eq('/plants')

      expect(page).to_not have_content(@plant1.name)
    end
  end

  describe 'links' do
    it 'takes you to the plant index' do
      visit "/plants/#{@plant1.id}"

      click_on('Plant Index')
      expect(current_path).to eq('/plants')
    end

    it 'takes you to the garden index' do
      visit "/plants/#{@plant1.id}"

      click_on('Garden Index')
      expect(current_path).to eq('/gardens')
    end

    it 'takes you to edit the garden' do
      visit "/plants/#{@plant1.id}"

      click_on('Edit Plant')
      expect(current_path).to eq("/plants/#{@plant1.id}/edit")
    end
  end
end
