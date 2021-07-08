require 'rails_helper'

RSpec.describe Garden, type: :model do
  describe 'instance methods' do
    describe '#plant_count' do
      before(:each) do
        @garden = Garden.create!(name: 'last garden', irrigation: true, plant_capacity: 5)
        @plant1 = @garden.plants.create!(name: 'daisy', edible: false, mature_height: 10)
        @plant2 = @garden.plants.create!(name: 'rose', edible: true, mature_height: 42)
        @plant3 = @garden.plants.create!(name: 'lily', edible: false, mature_height: 24)
      end
      it 'can count plants' do
        expect(@garden.plant_count).to eq(3)
      end
    end
  end
  
  describe "relationships" do
    it {should have_many :plants}
  end
end
