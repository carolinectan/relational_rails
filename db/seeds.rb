# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Plant.destroy_all
Farmer.destroy_all
Garden.destroy_all
Farm.destroy_all

miracle_garden = Garden.create!(name: 'Miracle Garden', irrigation: true, plant_capacity: 20)
butterfly_garden = Garden.create!(name: 'Butterfly Garden', irrigation: false, plant_capacity: 40)
bonsai_garden = Garden.create!(name: 'Bonsai Garden', irrigation: true, plant_capacity: 10)

miracle_garden.plants.create!(name: 'eggplant', edible: true, mature_height: 14)
miracle_garden.plants.create!(name: 'tomato', edible: true, mature_height: 48)
miracle_garden.plants.create!(name: 'cucumber', edible: true, mature_height: 30)

butterfly_garden.plants.create!(name: 'aster', edible: false, mature_height: 50)
butterfly_garden.plants.create!(name: 'bee balm', edible: true, mature_height: 24)
butterfly_garden.plants.create!(name: 'lavender', edible: true, mature_height: 48)

bonsai_garden.plants.create!(name: 'juniper bonsai', edible: true, mature_height: 16)
bonsai_garden.plants.create!(name: 'satsuki azaliea', edible: false, mature_height: 72)
bonsai_garden.plants.create!(name: 'chinese elm', edible: false, mature_height: 55)

strawberry_farm = Farm.create!(name: 'Strawberry Farm', has_animals: false, num_of_fields: 22)
llama_farm = Farm.create!(name: 'Llama Farm', has_animals: true, num_of_fields: 5)
vegetable_farm = Farm.create!(name: 'Vegetable Farm', has_animals: false, num_of_fields: 68)
sheep_farm = Farm.create!(name: 'Sheep Farm', has_animals: true, num_of_fields: 16)
sunflower_farm = Farm.create!(name: 'Sunflower Farm', has_animals: false, num_of_fields: 34)
strawberry_farm = Farm.create!(name: 'Strawberry Farm', has_animals: false, num_of_fields: 108)
chicken_farm = Farm.create!(name: 'Chicken Farm', has_animals: true, num_of_fields: 13)

strawberry_farm.farmers.create!(name: 'Joann', age: 42, owns_land: true)
strawberry_farm.farmers.create!(name: 'Sal', age: 64, owns_land: true)
strawberry_farm.farmers.create!(name: 'Teresa', age: 26, owns_land: false)

llama_farm.farmers.create!(name: 'Larry', age: 38, owns_land: false)
llama_farm.farmers.create!(name: 'Lucy', age: 72, owns_land: true)
llama_farm.farmers.create!(name: 'Jerry', age: 18, owns_land: false)
llama_farm.farmers.create!(name: 'Amanda', age: 30, owns_land: true)

vegetable_farm.farmers.create!(name: 'Vernon', age: 50, owns_land: true)
vegetable_farm.farmers.create!(name: 'Nancy', age: 34, owns_land: false)
vegetable_farm.farmers.create!(name: 'Peter', age: 47, owns_land: true)

sheep_farm.farmers.create!(name: 'Barbara', age: 63, owns_land: true)
sheep_farm.farmers.create!(name: 'Barnabus', age: 42, owns_land: true)
sheep_farm.farmers.create!(name: 'Bart', age: 58, owns_land: true)

sunflower_farm.farmers.create!(name: 'Frankie', age: 24, owns_land: false)
sunflower_farm.farmers.create!(name: 'Felipe', age: 56, owns_land: true)
sunflower_farm.farmers.create!(name: 'Fernando', age: 49, owns_land: true)

strawberry_farm.farmers.create!(name: 'Stacy', age: 84, owns_land: true)
strawberry_farm.farmers.create!(name: 'Sharon', age: 55, owns_land: false)
strawberry_farm.farmers.create!(name: 'Stevie', age: 30, owns_land: true)

chicken_farm.farmers.create!(name: 'Charles', age: 59, owns_land: true)
chicken_farm.farmers.create!(name: 'Chrissy', age: 22, owns_land: true)
chicken_farm.farmers.create!(name: 'Cameron', age: 59, owns_land: true)
chicken_farm.farmers.create!(name: 'Candy', age: 33, owns_land: false)
