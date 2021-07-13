require 'rails_helper'

RSpec.describe 'Garden Plants Index' do
  before(:each) do
    @garden = Garden.create!(name: 'last garden', irrigation: true, plant_capacity: 5)
    @plant1 = @garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)
    @plant2 = @garden.plants.create!(name: 'rose', edible: true, mature_height: 42)
    @plant3 = @garden.plants.create!(name: 'lily', edible: false, mature_height: 24)
  end

  it 'can display plants associated with garden' do
    visit ("/gardens/#{@garden.id}/plants")

    expect(page).to have_content(@garden.name)

    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
    expect(page).to have_content(@plant3.name)
  end

  it 'can display each plants attributes' do
    visit ("/gardens/#{@garden.id}/plants")

    expect(page).to have_content(@plant1.edible)
    expect(page).to have_content(@plant2.edible)
    expect(page).to have_content(@plant3.edible)

    expect(page).to have_content(@plant1.mature_height)
    expect(page).to have_content(@plant2.mature_height)
    expect(page).to have_content(@plant3.mature_height)
  end

  describe "links" do
    it 'takes you to the plant index' do
      visit ("/gardens/#{@garden.id}/plants")

      expect(page).to have_content('Plant Index')

      click_on('Plant Index')

      page.has_xpath?('/plants')
    end

    it 'takes you to the garden index' do
      visit ("/gardens/#{@garden.id}/plants")

      expect(page).to have_content('Garden Index')

      click_on('Garden Index')

      page.has_xpath?('/gardens')
    end

    it 'takes you to create a new plant child' do
      visit ("/gardens/#{@garden.id}/plants")

      click_on('Add New Plant')
      expect(current_path).to eq("/gardens/#{@garden.id}/plants/new")
    end

    it 'can display plants in alphabetical order' do
      visit "/gardens/#{@garden.id}/plants"

      click_on('sort by name')
      expect(current_path).to eq("/gardens/#{@garden.id}/plants")

      expect('daisy').to appear_before('lily', only_text: true)
      expect('lily').to appear_before('rose', only_text: true)
    end

    it 'takes you to edit a plant' do
      visit "/gardens/#{@garden.id}/plants"

      click_on("Edit #{@plant2.name}")
      expect(current_path).to eq("/plants/#{@plant2.id}/edit")
    end

    it 'can delete an instance of a plant' do
      visit "/plants"

      click_on "Delete #{@plant2.name}"
      expect(current_path).to eq('/plants')

      expect(page).to_not have_content(@plant2.name)
    end
  end

  describe 'filter by mature height' do
    it 'can display records over a given threshold' do
      visit "/gardens/#{@garden.id}/plants"

      fill_in "Minimum Height", with: '11'
      click_on "Only Return Plants that have Minimum Mature Height"

      expect(current_path).to eq("/gardens/#{@garden.id}/plants")

      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant2.mature_height)
      expect(page).to have_content(@plant3.name)
      expect(page).to have_content(@plant3.mature_height)
      expect(page).to_not have_content(@plant1.name)
    end
  end
end
