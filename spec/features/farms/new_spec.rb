require 'rails_helper'

RSpec.describe 'the Farm creation' do
  it 'links to the new page from the artists index' do
    visit '/farms'

    click_link('New Farm')

    expect(current_path).to eq('/farms/new')

    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent displayed.

  end
end
