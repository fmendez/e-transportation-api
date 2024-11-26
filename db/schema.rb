# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_26_213347) do
  create_table "e_scooters", force: :cascade do |t|
    t.integer "e_transportation_id", null: false
    t.boolean "lost_sensor", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vehicle_type"
    t.string "sensor_type"
    t.index ["e_transportation_id"], name: "index_e_scooters_on_e_transportation_id"
  end

  create_table "e_transportations", force: :cascade do |t|
    t.string "transportation_type", null: false
    t.string "sensor_type", null: false
    t.integer "owner_id", null: false
    t.boolean "in_zone", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_e_transportations_on_owner_id"
    t.index ["transportation_type"], name: "index_e_transportations_on_transportation_type"
  end

  add_foreign_key "e_scooters", "e_transportations"
end
