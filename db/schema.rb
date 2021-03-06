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

ActiveRecord::Schema.define(:version => 20130520193523) do

  create_table "bikers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "netid"
    t.string   "email"
    t.string   "affiliation"
    t.integer  "year_of_graduation"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "active",             :default => true, :null => false
  end

  add_index "bikers", ["email"], :name => "index_bikers_on_email", :unique => true
  add_index "bikers", ["netid"], :name => "index_bikers_on_netid", :unique => true

  create_table "bikes", :force => true do |t|
    t.string   "color"
    t.integer  "location_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "image_url"
    t.string   "manufacturer"
    t.string   "model"
    t.datetime "date_offline"
    t.boolean  "fucked",       :default => false, :null => false
    t.text     "notes",        :default => ""
  end

  create_table "checkouts", :force => true do |t|
    t.integer  "biker_id",                         :null => false
    t.integer  "bike_id",                          :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "location_id",                      :null => false
    t.datetime "due_at"
    t.datetime "returned_at"
    t.integer  "staffer_id"
    t.boolean  "helmet_requested"
    t.text     "notes",            :default => "", :null => false
  end

  add_index "checkouts", ["bike_id"], :name => "index_checkouts_on_bike_id"
  add_index "checkouts", ["biker_id"], :name => "index_checkouts_on_user_id"
  add_index "checkouts", ["location_id"], :name => "index_checkouts_on_location_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "latlong"
    t.string   "address"
    t.string   "phone"
    t.string   "hours"
    t.integer  "num_helmets"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                   :null => false
    t.string   "encrypted_password",   :default => "",    :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "netid",                                   :null => false
    t.integer  "location_id"
    t.boolean  "admin",                :default => false, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["netid"], :name => "index_users_on_netid", :unique => true

end
