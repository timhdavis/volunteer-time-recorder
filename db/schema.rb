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

ActiveRecord::Schema.define(version: 20181012192724) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.text "description"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_types", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.integer "quota_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_records", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "name"
    t.string "category"
    t.text "notes"
    t.integer "event_id"
    t.integer "volunteer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_time_records_on_event_id"
    t.index ["volunteer_id"], name: "index_time_records_on_volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.integer "member_type_id"
    t.index ["member_type_id"], name: "index_volunteers_on_member_type_id"
  end

end
