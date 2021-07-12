require 'rails_helper'

RSpec.describe Plant, type: :model do
  it {should belong_to :garden}

  it 'filters out false plants' do
    garden = Garden.create!(name: 'Test', irrigation: false, plant_capacity: 5)
    plant1 = garden.plants.create!(name: 'Tomato', edible: true, mature_height: 20)
    plant2 = garden.plants.create!(name: 'Poison Ivy', edible: false, mature_height: 10)
    plant3 = garden.plants.create!(name: 'Parsley', edible: true, mature_height: 16)
    plant4 = garden.plants.create!(name: 'Poison Oak', edible: false, mature_height: 22)

    expect(Plant.edible_filter).to eq([plant1, plant3])
  end

  it 'can order plants by name' do
    garden = Garden.create!(name: 'Test', irrigation: false, plant_capacity: 5)
    plant1 = garden.plants.create!(name: 'Celery', edible: true, mature_height: 20)
    plant2 = garden.plants.create!(name: 'Apple', edible: true, mature_height: 10)
    plant3 = garden.plants.create!(name: 'Banana', edible: true, mature_height: 16)

    expect(Plant.sort_name).to eq([plant2, plant3, plant1])
  end
end
