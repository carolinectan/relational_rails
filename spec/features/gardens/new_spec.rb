require 'rails_helper'

RSpec.describe 'create new garden' do
  describe 'create' do
    it 'can create a new garden' do
      visit "/gardens/new"

      fill_in('Name', with: 'test')
      fill_in('Plant Capacity', with: 25)
      page.check('irrigation')

      click_button('Add Garden')
      save_and_open_page
      expect(current_path).to eq('/gardens')
    end
  end
end
