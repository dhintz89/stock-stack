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
    t.string "companyName"
    t.string "primaryExchange"
    t.string "calculationPrice"
    t.float "open"
    t.float "close"
    t.float "high"
    t.float "low"
    t.float "latestPrice"
    t.string "latestSource"
    t.datetime "latestUpdate"
    t.integer "latestVolume"
    t.float "previousClose"
    t.float "change"
    t.float "changePercent"
    t.integer "market_cap"
    t.integer "peRatio"
    t.float "week52High"
    t.float "week52Low"
    t.float "ytdChange"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "profile_pic"
    t.string "email"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
    t.integer "security_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
