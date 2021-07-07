# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Garden.destroy_all
Farm.destroy_all
Plant.destroy_all
Farmer.destroy_all

miracle_garden = Garden.create!(name: 'Miracle Garden', irrigation: true, plant_capacity: 20)
butterfly_garden = Garden.create!(name: 'Butterfly Garden', irrigation: false, plant_capacity: 40)
bonsai_garden = Garden.create!(name: 'Bonsai Garden', irrigation: true, plant_capacity: 10)

strawberry_farm = Farm.create!(name: 'Strawberry Farm', has_animals: false, num_of_fields: 22)
llama_farm = Farm.create!(name: 'Llama Farm', has_animals: true, num_of_fields: 5)
vegetable_farm = Farm.create!(name: 'Vegetable Farm', has_animals: false, num_of_fields: 68)
