require 'rails_helper'

RSpec.describe 'the Farm creation' do
  it 'links to the new page from the artists index' do
    visit '/farms'

    click_link('Create New Farm')

    expect(current_path).to eq('/farms/new')
  end

  it 'can create a new farm' do
    visit '/farms/new'

    fill_in('name', with: 'Coconut Tree Farm')
    fill_in('has_animals', with: false)
    fill_in('num_of_fields', with: '42')
    
    click_button('Create New Farm')

    expect(current_path).to eq("/farms")
    expect(page).to have_content("Coconut Tree Farm\n(Created at: #{
      Farm.last.created_at})")
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
