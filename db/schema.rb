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

ActiveRecord::Schema.define(version: 2021_09_11_103054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.bigint "worship_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["worship_id"], name: "index_comments_on_worship_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id", "recipient_id"], name: "index_conversations_on_sender_id_and_recipient_id", unique: true
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "favorite_shintos", force: :cascade do |t|
    t.bigint "user_id", default: 0
    t.bigint "shinto_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shinto_id"], name: "index_favorite_shintos_on_shinto_id"
    t.index ["user_id"], name: "index_favorite_shintos_on_user_id"
  end

  create_table "favorite_worships", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "worship_id"
    t.index ["user_id"], name: "index_favorite_worships_on_user_id"
    t.index ["worship_id"], name: "index_favorite_worships_on_worship_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "ranking_items", force: :cascade do |t|
    t.bigint "ranking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text "memo"
    t.bigint "shinto_id"
    t.index ["ranking_id"], name: "index_ranking_items_on_ranking_id"
    t.index ["shinto_id"], name: "index_ranking_items_on_shinto_id"
  end

  create_table "rankings", force: :cascade do |t|
    t.integer "rank"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rankings_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "shinto_params", force: :cascade do |t|
    t.string "title"
    t.integer "points"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shinto_user_param_id"
    t.index ["shinto_user_param_id"], name: "index_shinto_params_on_shinto_user_param_id"
  end

  create_table "shinto_user_params", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shinto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shinto_id"], name: "index_shinto_user_params_on_shinto_id"
    t.index ["user_id"], name: "index_shinto_user_params_on_user_id"
  end

  create_table "shintos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "origin_shrine"
    t.string "origin_term"
    t.text "origin_history"
    t.string "original_url"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "kamisama"
    t.string "image"
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
    t.float "points"
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

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "worships"
  add_foreign_key "favorite_shintos", "shintos"
  add_foreign_key "favorite_shintos", "users"
  add_foreign_key "favorite_worships", "users"
  add_foreign_key "favorite_worships", "worships"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "ranking_items", "rankings"
  add_foreign_key "ranking_items", "shintos"
  add_foreign_key "rankings", "users"
  add_foreign_key "shinto_params", "shinto_user_params"
  add_foreign_key "shinto_user_params", "shintos"
  add_foreign_key "shinto_user_params", "users"
  add_foreign_key "user_introductions", "users"
  add_foreign_key "worship_params", "worships"
  add_foreign_key "worships", "shintos"
  add_foreign_key "worships", "users"
end
