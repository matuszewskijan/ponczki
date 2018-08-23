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

ActiveRecord::Schema.define(version: 2018_08_22_120036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloopers", force: :cascade do |t|
    t.integer "user_id"
    t.text "device"
    t.text "description"
    t.date "time"
    t.integer "founder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "owner_id"
    t.integer "eaten_doughnuts"
    t.integer "awaiting_doughnuts"
    t.text "slack_url"
    t.integer "members_count"
    t.integer "bloopers_cont"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "description"
    t.text "position"
    t.text "slack_nick"
    t.integer "eaten_doughnuts"
    t.integer "awaiting_doughnuts"
    t.integer "delivered_doughnuts"
    t.integer "bloopers_count"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
