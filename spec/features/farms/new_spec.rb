require 'rails_helper'

RSpec.describe 'the Farm creation', type: :feature do
  it 'links to the new page from the artists index' do
    visit '/farms'

    click_link('Add New Farm')

    expect(current_path).to eq('/farms/new')
  end

  it 'can create a new farm' do
    visit '/farms/new'

    fill_in('name', with: 'Coconut Tree Farm')
    uncheck('has_animals')
    fill_in('num_of_fields', with: '42')

    click_button('Add New Farm')

    expect(current_path).to eq("/farms")
    expect(page).to have_content("Coconut Tree Farm\n(#{Farm.last.created_at})")
  end

  it 'can display a navigation bar' do
    visit "/farms/new"

    expect(page).to have_link('Home', :href => '/')
    expect(page).to have_link('Farm Index', :href => '/farms')
    expect(page).to have_link('Farmer Index', :href => '/farmers')
    expect(page).to have_link('Plant Index', :href => '/plants')
    expect(page).to have_link('Garden Index', :href => '/gardens')
  end
end
