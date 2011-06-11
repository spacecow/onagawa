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

ActiveRecord::Schema.define(:version => 20110610113943) do

  create_table "carts", :force => true do |t|
    t.datetime "purchased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "info_sections", :force => true do |t|
    t.string   "title"
    t.integer  "pos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "info_subsections", :force => true do |t|
    t.integer  "info_section_id"
    t.text     "content"
    t.integer  "pos"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_ja"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_transactions", :force => true do |t|
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "purchase_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "zipcode"
    t.string   "email"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.integer  "order_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", :force => true do |t|
    t.integer  "quantity"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "purchased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip_address"
  end

  create_table "settings", :force => true do |t|
    t.string   "prefix"
    t.string   "contact_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "roles_mask"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
