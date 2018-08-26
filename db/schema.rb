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

ActiveRecord::Schema.define(version: 2018_08_26_142414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloopers", force: :cascade do |t|
    t.integer "user_id"
    t.text "device"
    t.text "description"
    t.date "time"
    t.integer "finder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "doughnut_counter"
    t.boolean "delivery_status"
    t.boolean "noticed"
  end

  create_table "teams", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "owner_id"
    t.integer "eaten_doughnuts", default: 0
    t.integer "awaiting_doughnuts", default: 0
    t.text "slack_url"
    t.integer "members_count", default: 0
    t.integer "bloopers_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slack_id"
    t.string "slack_name"
    t.boolean "setted_up"
    t.string "avatar_url"
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "description"
    t.text "position"
    t.text "slack_nick"
    t.integer "eaten_doughnuts", default: 0
    t.integer "awaiting_doughnuts", default: 0
    t.integer "delivered_doughnuts", default: 0
    t.integer "bloopers_count", default: 0
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "provider"
    t.string "slack_id"
    t.string "avatar_url"
    t.integer "team_admin_id"
    t.integer "findings_count"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
