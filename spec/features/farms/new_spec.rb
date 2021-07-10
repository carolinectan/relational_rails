require 'rails_helper'

RSpec.describe 'the Farm creation' do
  it 'links to the new page from the artists index' do
    visit '/farms'

    click_link('New Farm')

    expect(current_path).to eq('/farms/new')
  end

  it 'can create a new farm' do
    visit '/farms/new'

    fill_in('name', with: 'Coconut Tree Farm')
    fill_in('has_animals', with: false)
    fill_in('num_of_fields', with: '42')
    click_button('Create Farm')

    expect(current_path).to eq("/farms")
    save_and_open_page
    expect(page).to have_content("Coconut Tree Farm\n(Created at: #{Farm.last.created_at})")
  end
end
