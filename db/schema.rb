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

ActiveRecord::Schema.define(version: 2021_08_22_015247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_shintos", force: :cascade do |t|
    t.bigint "user_id", default: 0
    t.bigint "shinto_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shinto_id"], name: "index_favorite_shintos_on_shinto_id"
    t.index ["user_id"], name: "index_favorite_shintos_on_user_id"
  end

  create_table "shintos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "origin_shrine"
    t.string "origin_term"
    t.text "origin_history"
    t.string "main_kamisama"
    t.string "sub_kamisama1"
    t.string "sub_kamisama2"
    t.string "original_url"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_introductions", force: :cascade do |t|
    t.integer "address"
    t.string "image"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_user_introductions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "worship_params", force: :cascade do |t|
    t.string "title"
    t.integer "points"
    t.text "memo"
    t.bigint "worship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["worship_id"], name: "index_worship_params_on_worship_id"
  end

  create_table "worships", force: :cascade do |t|
    t.date "worship_day"
    t.integer "weather"
    t.text "memo"
    t.string "image"
    t.bigint "user_id", null: false
    t.bigint "shinto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shinto_id"], name: "index_worships_on_shinto_id"
    t.index ["user_id"], name: "index_worships_on_user_id"
  end

  add_foreign_key "favorite_shintos", "shintos"
  add_foreign_key "favorite_shintos", "users"
  add_foreign_key "user_introductions", "users"
  add_foreign_key "worship_params", "worships"
  add_foreign_key "worships", "shintos"
  add_foreign_key "worships", "users"
end
