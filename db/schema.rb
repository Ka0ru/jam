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

ActiveRecord::Schema.define(version: 20140221115121) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "id_client"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders_products", force: true do |t|
    t.integer  "id_order"
    t.integer  "id_product"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string "title"
    t.text   "description"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "photo"
    t.float    "price"
    t.float    "margin"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_ingredients", force: true do |t|
    t.integer  "id_product"
    t.integer  "id_ingredient"
    t.float    "nb_ingredient"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
