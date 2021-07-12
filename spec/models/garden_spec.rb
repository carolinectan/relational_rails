require 'rails_helper'

RSpec.describe Garden, type: :model do
  describe 'instance methods' do
    before(:each) do
      @garden1 = Garden.create!(name: 'last garden', irrigation: true, plant_capacity: 5)
      @garden2 = Garden.create!(name: 'middle garden', irrigation: true, plant_capacity: 8)
      @garden3 = Garden.create!(name: 'first garden', irrigation: true, plant_capacity: 10)
      @plant1 = @garden1.plants.create!(name: 'daisy', edible: false, mature_height: 10)
      @plant2 = @garden1.plants.create!(name: 'rose', edible: true, mature_height: 42)
      @plant3 = @garden1.plants.create!(name: 'lily', edible: false, mature_height: 24)
    end
    describe '#sort_descending' do
      it 'can order gardens by created_at' do
        expect(Garden.sort_descending).to eq([@garden3, @garden2, @garden1])
      end
    end
    
    describe '#plant_count' do
      it 'can count plants' do
        expect(@garden1.plant_count).to eq(3)
      end
    end
  end

  describe "relationships" do
    it {should have_many :plants}
  end
end
