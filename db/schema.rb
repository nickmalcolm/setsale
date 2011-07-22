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

ActiveRecord::Schema.define(:version => 20110722004410) do

  create_table "products", :force => true do |t|
    t.string   "handle"
    t.string   "product_type"
    t.text     "body_html"
    t.string   "title"
    t.string   "tags"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.datetime "starts_at"
    t.datetime "ends_at"
  end

  create_table "shops", :force => true do |t|
    t.integer  "shopify_id"
    t.string   "domain"
    t.string   "api_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
