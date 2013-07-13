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

ActiveRecord::Schema.define(:version => 20130713011610) do

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "term_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "comments", ["term_id"], :name => "index_comments_on_term_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "term_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favorites", ["term_id"], :name => "index_favorites_on_term_id"
  add_index "favorites", ["user_id", "term_id"], :name => "index_favorites_on_user_id_and_term_id", :unique => true
  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id"

  create_table "flags", :force => true do |t|
    t.integer  "flaggable_id"
    t.string   "flaggable_type"
    t.text     "reason"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
  end

  create_table "links", :id => false, :force => true do |t|
    t.integer "left_term_id"
    t.integer "right_term_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "subject"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false, :null => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
