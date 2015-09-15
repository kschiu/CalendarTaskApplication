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

ActiveRecord::Schema.define(version: 20150914205708) do

  create_table "calendars", force: true do |t|
    t.string   "year",       default: "2015"
    t.string   "month",      default: "9"
    t.string   "day",        default: "16"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "recurrence"
    t.datetime "created_at"
    t.datetime "updated_at"
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

end
