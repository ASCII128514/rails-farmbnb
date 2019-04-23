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

ActiveRecord::Schema.define(version: 2019_04_23_055704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_listings_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "shopping_cart_id"
    t.integer "quantity"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["shopping_cart_id"], name: "index_orders_on_shopping_cart_id"
  end

  create_table "price_histories", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "previous_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_price_histories_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.float "product_price"
    t.text "description"
    t.string "picture_url"
    t.string "unit"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "profile_picture_url"
    t.string "openId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "listings", "products"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "shopping_carts"
  add_foreign_key "price_histories", "products"
  add_foreign_key "products", "users"
  add_foreign_key "shopping_carts", "users"
end
