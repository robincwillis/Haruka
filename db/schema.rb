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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130711013945) do

  create_table "comments", :force => true do |t|
    t.string   "author"
    t.text     "body"
    t.integer  "term_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["term_id"], :name => "index_comments_on_term_id"

  create_table "links", :id => false, :force => true do |t|
    t.integer "left_term_id"
    t.integer "right_term_id"
  end

  create_table "phrases", :force => true do |t|
    t.text     "english"
    t.text     "japanese"
    t.integer  "user_id"
    t.integer  "term_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "terms", :force => true do |t|
    t.string   "name"
    t.string   "kanji"
    t.string   "kana"
    t.string   "def"
    t.string   "lit"
    t.string   "desc"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "phonetic"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
  end

  add_index "terms", ["user_id"], :name => "index_terms_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "varients", :force => true do |t|
    t.integer  "term_id"
    t.integer  "term_varient_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
