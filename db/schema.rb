# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_06_204245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "farmers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "owns_land"
    t.integer "age"
    t.string "name"
    t.bigint "farm_id"
    t.index ["farm_id"], name: "index_farmers_on_farm_id"
  end

  create_table "farms", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "has_animals"
    t.integer "num_of_fields"
    t.string "name"
  end

  create_table "gardens", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.boolean "irrigation"
    t.integer "plant_capacity"
  end

  create_table "plants", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.boolean "edible"
    t.integer "mature_height"
    t.bigint "garden_id"
    t.index ["garden_id"], name: "index_plants_on_garden_id"
  end

  add_foreign_key "farmers", "farms"
  add_foreign_key "plants", "gardens"
end
