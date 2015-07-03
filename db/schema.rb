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

ActiveRecord::Schema.define(version: 20150703185730) do

  create_table "announcements", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bug_categories", force: true do |t|
    t.integer "bug_id"
    t.integer "category_id"
  end

  create_table "bugs", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "resolved",   default: false
    t.integer  "user_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "bug_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenants", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "gender",             default: "female"
    t.text     "job_description"
    t.boolean  "has_pet",            default: false
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "native_language"
    t.string   "status",             default: "PENDING"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "time_zone"
  end

end
