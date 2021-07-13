require 'rails_helper'

RSpec.describe Farmer, type: :model do
  it {should belong_to :farm}
  before(:each) do
    Farmer.destroy_all
    Farm.destroy_all

    @farm = Farm.create!(name: 'Alpaca Farm', has_animals: true, num_of_fields: 3)
    @farmer_1 = @farm.farmers.create!(name: 'James', age: 56, owns_land: true)
    @farmer_2 = @farm.farmers.create!(name: 'Becky', age: 20, owns_land: false)
  end

  it 'can filter farmers if owns_land is true' do
    expect(Farmer.owns_land_filter).to eq([@farmer_1])
  end

  it 'can sort farmers by name' do
    expect(Farmer.sort_name).to eq([@farmer_2, @farmer_1])
  end
end
