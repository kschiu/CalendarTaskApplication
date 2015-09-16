# encoding: UTF-8
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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150914205708) do

  create_table "calendars", force: true do |t|
    t.string   "year",       default: "2015"
    t.string   "month",      default: "9"
    t.string   "day",        default: "16"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
=======
ActiveRecord::Schema.define(version: 20150916042909) do
>>>>>>> calendarAPI

  create_table "events", force: true do |t|
    t.string   "status"
    t.string   "htmlLink"
    t.string   "summary"
    t.string   "description"
    t.date     "startDate"
    t.datetime "startDateTime"
    t.string   "startTimeZone"
    t.date     "endDate"
    t.datetime "endDateTime"
    t.string   "endTimeZone"
    t.boolean  "endTimeUnspecified"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "google_id"
    t.integer  "user_id"
  end

  create_table "tasks", force: true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.text     "description"
    t.date     "end_date"
    t.time     "end_time"
    t.boolean  "is_complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "token"
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
