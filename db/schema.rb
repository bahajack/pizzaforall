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

ActiveRecord::Schema.define(version: 2021_07_10_220729) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "menu_name"
    t.string "menu_type"
    t.string "size"
    t.decimal "price"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_menus_on_order_id"
  end

  create_table "menus_orders", id: false, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "menu_id", null: false
    t.index ["menu_id", "order_id"], name: "index_menus_orders_on_menu_id_and_order_id"
    t.index ["order_id", "menu_id"], name: "index_menus_orders_on_order_id_and_menu_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "product_name"
    t.integer "product_count"
    t.string "product_type"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "store_name"
    t.string "store_address"
    t.string "order_type"
    t.integer "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_stores_on_menu_id"
  end

  create_table "toppings", force: :cascade do |t|
    t.string "topping_name"
    t.decimal "topping_price"
    t.integer "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_toppings_on_menu_id"
  end

end
