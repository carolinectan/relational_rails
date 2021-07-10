require 'rails_helper'

RSpec.describe 'create new plant child' do
  describe 'create' do
    it 'can add a new plant to a garden' do
      garden = Garden.create!(name: 'test garden', irrigation: true, plant_capacity: 5)

      visit "/gardens/#{garden.id}/plants/new"

      fill_in('Name', with: 'poppy')
      fill_in('Mature Height', with: 16)
      page.check('Edible')

      click_button("Add Plant")

      expect(current_path).to eq("/gardens/#{garden.id}/plants")
      expect(page).to have_content("poppy")
      expect(page).to have_content("Edible: true")
      expect(page).to have_content("Mature Height: 16")
    end
  end
end
