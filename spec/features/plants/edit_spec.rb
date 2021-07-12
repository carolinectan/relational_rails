require 'rails_helper'

RSpec.describe "Edit an existing plant" do
  describe "Update" do
    it 'can edit an existing plant' do
      garden = Garden.create!(name: 'sample garden', irrigation: true, plant_capacity: 10)
      plant1 = garden.plants.create!(name: 'dasy', edible: true, mature_height: 200000)

      visit "/plants/#{plant1.id}/edit"

      fill_in('Name', with: 'Daisy')
      fill_in('Mature Height', with: 20)
      page.uncheck('Edible')

      click_button("Update Plant")
      expect(current_path).to eq("/plants/#{plant1.id}")

      expect(page).to have_content("Daisy")
      expect(page).to have_content("Edible: false")
      expect(page).to have_content("Mature Height: 20")
    end
  end
end
