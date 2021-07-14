require 'rails_helper'

RSpec.describe 'plants index page' do
  before(:each) do
    @garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)

    @plant1 = @garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)
    @plant2 = @garden.plants.create!(name: 'rose', edible: true, mature_height: 42)
    @plant3 = @garden.plants.create!(name: 'Parsley', edible: true, mature_height: 16)
    @plant4 = @garden.plants.create!(name: 'Poison Oak', edible: false, mature_height: 22)
  end

  describe 'display' do
    it 'displays all plant names' do
      visit '/plants'

      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)

      expect(page).to have_content(@plant2.edible)
      expect(page).to have_content(@plant3.edible)

      expect(page).to have_content(@plant2.mature_height)
      expect(page).to have_content(@plant3.mature_height)

    end

    it 'only displays plants with edible: true' do
      visit '/plants'

      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)

      expect(page).to_not have_content(@plant1.name)
      expect(page).to_not have_content(@plant4.name)
    end
  end

  describe 'delete' do
    it 'can delete an instance of a plant' do
      visit '/plants'

      click_on "Delete #{@plant2.name}"
      expect(current_path).to eq('/plants')

      expect(page).to_not have_content(@plant2.name)
    end
  end

  describe 'links' do
    it 'takes you to the plant index' do
      visit '/plants'

      click_on('Plant Index')
      expect(current_path).to eq('/plants')
    end

    it 'takes you to the garden index' do
      visit '/plants'

      click_on('Garden Index')
      expect(current_path).to eq('/gardens')
    end

    it 'takes you to edit a plant' do
      visit '/plants'

      click_on("Edit #{@plant2.name}")
      expect(current_path).to eq("/plants/#{@plant2.id}/edit")
    end
  end
end
