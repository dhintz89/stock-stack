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

ActiveRecord::Schema.define(version: 2019_08_29_225724) do

  create_table "securities", force: :cascade do |t|
    t.string "symbol"
    t.string "company_name"
    t.string "primary_exchange"
    t.string "calculation_price"
    t.integer "open"
    t.integer "close"
    t.integer "high"
    t.integer "low"
    t.integer "latest_price"
    t.string "latest_source"
    t.datetime "latest_update"
    t.integer "latest_volume"
    t.integer "iex_realtime_price"
    t.integer "iex_realtime_size"
    t.datetime "iex_last_updated"
    t.integer "delayed_price"
    t.datetime "delayed_price_time"
    t.integer "previous_close"
    t.integer "change"
    t.integer "change_percent"
    t.integer "iex_market_percent"
    t.integer "iex_volume"
    t.integer "avg_total_volume"
    t.integer "iex_bid_price"
    t.integer "iex_bid_size"
    t.integer "iex_ask_price"
    t.integer "iex_ask_size"
    t.integer "market_cap"
    t.integer "pe_ratio"
    t.integer "week52_high"
    t.integer "week52_low"
    t.integer "ytd_change"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "total_value"
    t.integer "total_change"
    t.integer "last_updated"
    t.integer "user_id"
    t.integer "security_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
