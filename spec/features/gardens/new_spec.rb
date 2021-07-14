require 'rails_helper'

RSpec.describe 'create new garden' do
  describe 'create' do
    it 'can create a new garden' do
      visit '/gardens/new'

      fill_in('Name', with: 'test')
      fill_in('Plant Capacity', with: 25)
      page.check('irrigation')

      click_button('Add Garden')
      expect(current_path).to eq('/gardens')

      expect(page).to have_content('test')
    end
  end
end
