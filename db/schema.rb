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

ActiveRecord::Schema.define(:version => 20121216015731) do

  create_table "oauth2_access_tokens", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "refresh_token_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "oauth2_access_tokens", ["client_id"], :name => "index_oauth2_access_tokens_on_client_id"
  add_index "oauth2_access_tokens", ["expires_at"], :name => "index_oauth2_access_tokens_on_expires_at"
  add_index "oauth2_access_tokens", ["token"], :name => "index_oauth2_access_tokens_on_token", :unique => true
  add_index "oauth2_access_tokens", ["user_id"], :name => "index_oauth2_access_tokens_on_user_id"

  create_table "oauth2_authorization_codes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "oauth2_authorization_codes", ["client_id"], :name => "index_oauth2_authorization_codes_on_client_id"
  add_index "oauth2_authorization_codes", ["expires_at"], :name => "index_oauth2_authorization_codes_on_expires_at"
  add_index "oauth2_authorization_codes", ["token"], :name => "index_oauth2_authorization_codes_on_token", :unique => true
  add_index "oauth2_authorization_codes", ["user_id"], :name => "index_oauth2_authorization_codes_on_user_id"

  create_table "oauth2_clients", :force => true do |t|
    t.string   "name"
    t.string   "redirect_uri"
    t.string   "website"
    t.string   "identifier"
    t.string   "secret"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "oauth2_clients", ["identifier"], :name => "index_oauth2_clients_on_identifier", :unique => true

  create_table "oauth2_refresh_tokens", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "oauth2_refresh_tokens", ["client_id"], :name => "index_oauth2_refresh_tokens_on_client_id"
  add_index "oauth2_refresh_tokens", ["expires_at"], :name => "index_oauth2_refresh_tokens_on_expires_at"
  add_index "oauth2_refresh_tokens", ["token"], :name => "index_oauth2_refresh_tokens_on_token", :unique => true
  add_index "oauth2_refresh_tokens", ["user_id"], :name => "index_oauth2_refresh_tokens_on_user_id"

  create_table "retrospections", :force => true do |t|
    t.text     "body"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.date     "retrospected_on"
    t.integer  "user_id"
  end

  add_index "retrospections", ["user_id", "retrospected_on"], :name => "index_retrospections_on_user_id_and_retrospected_on"
  add_index "retrospections", ["user_id"], :name => "index_retrospections_on_user_id"

  create_table "sleeps", :force => true do |t|
    t.datetime "slept_at"
    t.datetime "woke_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "sleeps", ["user_id"], :name => "index_sleeps_on_user_id"

  create_table "trackables", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trackables", ["user_id"], :name => "index_trackables_on_user_id"

  create_table "trackings", :force => true do |t|
    t.integer  "trackable_id"
    t.float    "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "trackings", ["trackable_id"], :name => "index_trackings_on_trackable_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "token",                  :limit => 16
    t.string   "type"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["token"], :name => "index_users_on_token", :unique => true

end
