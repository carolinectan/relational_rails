require 'rails_helper'

RSpec.describe 'welcome page index' do
  it 'can display a navigation bar' do
    visit '/'

    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')
  end
end
