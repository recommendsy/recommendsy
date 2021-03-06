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

ActiveRecord::Schema.define(version: 20140522235140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: true do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "favorited_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "listing_id"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "listing_url"
    t.string   "images",      default: [], array: true
  end

  create_table "reminders", force: true do |t|
    t.date    "reminder_date"
    t.string  "title"
    t.integer "recipient_id"
    t.integer "user_id"
    t.boolean "sent_status"
    t.integer "lead_time"
    t.boolean "active"
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
    t.string   "name"
    t.string   "nickname"
    t.integer  "user_id"
    t.string   "image"
    t.string   "bio"
    t.integer  "birth_month"
    t.integer  "birth_day"
    t.integer  "birth_year"
    t.integer  "transaction_buy_count"
    t.integer  "transaction_sold_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
