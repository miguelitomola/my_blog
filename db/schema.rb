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

ActiveRecord::Schema.define(version: 20150305225011) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "articles_date_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["articles_date_id"], name: "index_articles_on_articles_date_id"

  create_table "articles_dates", force: true do |t|
    t.integer  "day"
    t.string   "month"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "admin_flag",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
