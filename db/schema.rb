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

ActiveRecord::Schema.define(version: 20150326232219) do

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid"

  create_table "builds", force: :cascade do |t|
    t.string   "rim"
    t.string   "hub"
    t.integer  "erd"
    t.integer  "flange_diameter_left"
    t.integer  "flange_diameter_right"
    t.integer  "flange_center_left"
    t.integer  "flange_center_right"
    t.integer  "spoke_count"
    t.integer  "spoke_hole_diameter"
    t.integer  "spoke_crosses"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
  end

  create_table "classified_attachments", force: :cascade do |t|
    t.string   "picture"
    t.integer  "classified_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "classified_attachments", ["classified_id"], name: "index_classified_attachments_on_classified_id"

  create_table "classified_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifieds", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "amount"
    t.string   "email"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "image"
    t.string   "address"
    t.decimal  "latitude",               precision: 9, scale: 6
    t.decimal  "longitude",              precision: 9, scale: 6
    t.integer  "classified_category_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "avatar"
    t.integer  "user_id"
    t.integer  "photo_category_id"
  end

  create_table "posters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "classified_id"
    t.text     "message"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "photo_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                                   null: false
    t.string   "last_name",                                    null: false
    t.string   "email",                                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "profile_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.boolean  "admin",                        default: false
    t.text     "about"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"

end
