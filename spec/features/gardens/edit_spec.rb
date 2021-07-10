require 'rails_helper'

RSpec.describe 'edit existing garden' do
  describe "update" do
    it 'can edit an existing garden' do
      garden = Garden.create!(name: "wrong gardin", irrigation: true, plant_capacity: 22)

      visit "/gardens/#{garden.id}/edit"

      click_button('Update Garden')
      expect(current_path).to eq("/gardens/#{garden.id}")
    end
  end
end
