require 'rails_helper'

RSpec.describe 'gardens show page' do
  before(:each) do
    @garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)

    @plant1 = @garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)
    @plant2 = @garden.plants.create!(name: 'rose', edible: true, mature_height: 42)
  end
  it 'displays garden name and attributes' do
    visit "/gardens/#{@garden.id}"

    expect(page).to have_content(@garden.name)
    expect(page).to have_content(@garden.irrigation)
    expect(page).to have_content(@garden.plant_capacity)
  end

  it 'displays the number of plants associated with the garden' do
    visit "/gardens/#{@garden.id}"

    expect(page).to have_content('Total Plants: 2')
  end
  describe "links" do
    it 'takes you to the plant index' do
      visit "/gardens/#{@garden.id}"

      expect(page).to have_content('Plant Index')

      click_on('Plant Index')

      page.has_xpath?('/plants')
    end

    it 'takes you to the garden index' do
      visit "/gardens/#{@garden.id}"

      expect(page).to have_content('Garden Index')

      click_on('Garden Index')

      page.has_xpath?('/gardens')
    end

    it "takes you to the garden's plant index" do
      garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)
      plant1 = garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)
      visit "/gardens/#{garden.id}"

      expect(page).to have_content("#{garden.name}'s Plants")

      click_on("#{garden.name}'s Plants")

      expect(current_path).to eq("/gardens/#{garden.id}/plants")
    end

    it 'takes you to edit the garden' do
      garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)

      visit "/gardens/#{garden.id}"

      click_button("Edit Garden")
      expect(current_path).to eq("/gardens/#{garden.id}/edit")
    end

    it 'can delete a garden instance' do
      garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)
      visit "/gardens/#{garden.id}"

      expect(page).to have_content(garden.name)

      click_on 'Delete Garden'
      expect(current_path).to eq('/gardens')

      expect(page).to_not have_content(garden.name)
    end
  end
end
