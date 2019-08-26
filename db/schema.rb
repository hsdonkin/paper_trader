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

ActiveRecord::Schema.define(version: 2019_08_26_172214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "portfolios", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "stocks_id"
    t.index ["stocks_id"], name: "index_portfolios_on_stocks_id"
    t.index ["users_id"], name: "index_portfolios_on_users_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.boolean "gain", default: true
    t.decimal "current_price", precision: 10, scale: 4
    t.decimal "daily_open", precision: 10, scale: 4
    t.decimal "daily_close", precision: 10, scale: 4
    t.decimal "weekly_open", precision: 10, scale: 4
    t.decimal "weekly_close", precision: 10, scale: 4
    t.decimal "monthly_open", precision: 10, scale: 4
    t.decimal "monthly_close", precision: 10, scale: 4
    t.decimal "daily_high", precision: 10, scale: 4
    t.decimal "daily_low", precision: 10, scale: 4
    t.decimal "weekly_high", precision: 10, scale: 4
    t.decimal "weekly_low", precision: 10, scale: 4
    t.decimal "monthly_high", precision: 10, scale: 4
    t.decimal "monthly_low", precision: 10, scale: 4
    t.decimal "yearly_high", precision: 10, scale: 4
    t.decimal "yearly_low", precision: 10, scale: 4
    t.bigint "volume"
  end

  create_table "trades", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "stock_id"
    t.integer "quantity"
    t.decimal "buy_sell_price", precision: 10, scale: 4
    t.datetime "log_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_trades_on_stock_id"
    t.index ["user_id"], name: "index_trades_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.decimal "cash", precision: 10, scale: 2, default: "10000.0"
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.bigint "stock_id"
    t.decimal "price", precision: 10, scale: 4
    t.datetime "log_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_values_on_stock_id"
  end

  add_foreign_key "portfolios", "stocks", column: "stocks_id"
  add_foreign_key "portfolios", "users", column: "users_id"
  add_foreign_key "trades", "stocks"
  add_foreign_key "trades", "users"
  add_foreign_key "values", "stocks"
end
