# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_02_135832) do

  create_table "contributors", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.date "joindate"
    t.string "password"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "greetings", force: :cascade do |t|
    t.string "word"
    t.text "story"
    t.string "audio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "contributor_id", null: false
    t.integer "region_id", null: false
    t.index ["contributor_id"], name: "index_greetings_on_contributor_id"
    t.index ["region_id"], name: "index_greetings_on_region_id"
  end

  create_table "photos", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "greeting_id", null: false
    t.index ["greeting_id"], name: "index_photos_on_greeting_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "photomap"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "greetings", "contributors"
  add_foreign_key "greetings", "regions"
  add_foreign_key "photos", "greetings"
end
