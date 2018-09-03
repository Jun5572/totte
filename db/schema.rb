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

ActiveRecord::Schema.define(version: 2018_09_02_043812) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "album_items", force: :cascade do |t|
    t.integer "album_id"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.text "introduction"
    t.string "thumbnail_id"
    t.integer "user_id"
    t.integer "event_id"
    t.integer "like_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cameras", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "lens_info"
    t.string "lens_make"
    t.string "lens_model"
    t.string "thumbnail_id"
    t.string "url"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "staff"
    t.string "url"
    t.text "introduction"
    t.integer "place_id"
    t.string "thumbnail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "detail"
    t.integer "type", default: 0, null: false
    t.datetime "open_date"
    t.datetime "close_date"
    t.integer "place_id"
    t.integer "user_id"
    t.integer "company_id"
    t.integer "interest_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exifs", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "lens_info"
    t.string "lens_make"
    t.string "lens_model"
    t.float "alitude"
    t.string "longitude"
    t.string "latitude"
    t.datetime "shooting_date"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.integer "followable_id", null: false
    t.string "follower_type", null: false
    t.integer "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id"
  end

  create_table "interests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.integer "user_id"
    t.integer "notice_by_id"
    t.integer "photo_id"
    t.string "notice_type"
    t.boolean "read", default: false
    t.index ["notice_by_id"], name: "index_notices_on_notice_by_id"
    t.index ["photo_id"], name: "index_notices_on_photo_id"
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image_id"
    t.string "title"
    t.integer "camera_id"
    t.integer "user_id"
    t.integer "event_id"
    t.integer "company_id"
    t.integer "color_id"
    t.integer "like_count", default: 0, null: false
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "postal_code"
    t.string "pref"
    t.string "city"
    t.string "address1"
    t.string "address2"
    t.integer "event_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.integer "gender", limit: 1, default: 0, null: false
    t.string "header_image_id"
    t.string "thumbnail_id"
    t.integer "user_type", limit: 1, default: 0, null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
