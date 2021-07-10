require 'rails_helper'

RSpec.describe 'the Farm edit' do
  before :each do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 8)
  end

  it 'links to the edit page' do
    visit "/farms/#{@farm.id}"

    click_button "Update #{@farm.name}"

    expect(current_path).to eq("/farms/#{@farm.id}/edit")

    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
  end
end
