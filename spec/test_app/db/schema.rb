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

ActiveRecord::Schema.define(version: 20141224221959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_web_albums", force: true do |t|
    t.string   "title",      null: false
    t.date     "date",       null: false
    t.string   "local"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_web_events", force: true do |t|
    t.string   "title",        null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "description",  null: false
    t.string   "street",       null: false
    t.string   "number"
    t.string   "zipcode",      null: false
    t.string   "neighborhood", null: false
    t.string   "city",         null: false
    t.string   "state",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_web_images", force: true do |t|
    t.integer  "album_id",   null: false
    t.string   "file",       null: false
    t.boolean  "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_web_institutionals", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_web_posts", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.string   "abstract"
    t.text     "body",       null: false
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_web_posts", ["user_id"], name: "index_admin_web_posts_on_user_id", using: :btree

  create_table "admin_web_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_type"
  end

  add_index "admin_web_users", ["email"], name: "index_admin_web_users_on_email", unique: true, using: :btree
  add_index "admin_web_users", ["reset_password_token"], name: "index_admin_web_users_on_reset_password_token", unique: true, using: :btree

  create_table "admin_web_videos", force: true do |t|
    t.string   "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

end
