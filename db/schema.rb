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

ActiveRecord::Schema.define(version: 2020_04_25_041531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "describe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comment_number", default: 0
    t.integer "reply_comment_id", default: 0
    t.index ["describe_id"], name: "index_comments_on_describe_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "describe_categories", force: :cascade do |t|
    t.bigint "describe_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_describe_categories_on_category_id"
    t.index ["describe_id"], name: "index_describe_categories_on_describe_id"
  end

  create_table "describe_tags", force: :cascade do |t|
    t.bigint "describe_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["describe_id"], name: "index_describe_tags_on_describe_id"
    t.index ["tag_id"], name: "index_describe_tags_on_tag_id"
  end

  create_table "describes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.json "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "likes_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.integer "original_id"
    t.integer "lnappropriates_count", default: 0, null: false
    t.index ["user_id"], name: "index_describes_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "describe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["describe_id"], name: "index_likes_on_describe_id"
    t.index ["user_id", "describe_id"], name: "index_likes_on_user_id_and_describe_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "lnappropriates", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "describe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["describe_id"], name: "index_lnappropriates_on_describe_id"
    t.index ["user_id"], name: "index_lnappropriates_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "profile_image"
    t.boolean "admin", default: false
    t.boolean "receive", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "describes"
  add_foreign_key "comments", "users"
  add_foreign_key "describe_categories", "categories"
  add_foreign_key "describe_categories", "describes"
  add_foreign_key "describe_tags", "describes"
  add_foreign_key "describe_tags", "tags"
  add_foreign_key "describes", "users"
  add_foreign_key "likes", "describes"
  add_foreign_key "likes", "users"
  add_foreign_key "lnappropriates", "describes"
  add_foreign_key "lnappropriates", "users"
  add_foreign_key "tags", "users"
end
