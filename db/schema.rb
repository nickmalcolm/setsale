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

ActiveRecord::Schema.define(:version => 20110730113038) do

  create_table "discounts", :force => true do |t|
    t.integer  "product_id"
    t.integer  "shop_id"
    t.integer  "sale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "handle"
    t.string   "product_type"
    t.text     "body_html"
    t.string   "title"
    t.string   "tags"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
    t.integer  "shopify_id"
  end

  create_table "sales", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.decimal  "amount",      :precision => 16, :scale => 2, :default => 0.0
    t.string   "amount_type"
    t.integer  "shop_id"
  end

  create_table "shops", :force => true do |t|
    t.integer  "shopify_id"
    t.string   "domain"
    t.string   "api_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency",                   :default => "USD"
    t.string   "money_with_currency_format", :default => "${{amount}} USD"
  end

end
