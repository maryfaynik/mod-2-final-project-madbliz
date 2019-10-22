# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_21_144014) do

  create_table "blanks", force: :cascade do |t|
    t.string "speech_part"
    t.integer "madlib_id", null: false
    t.string "input", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["madlib_id"], name: "index_blanks_on_madlib_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "madlib_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["madlib_id"], name: "index_favorites_on_madlib_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "madlibs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "catgegory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "placed", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "trinket_orders", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "trinket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_trinket_orders_on_order_id"
    t.index ["trinket_id"], name: "index_trinket_orders_on_trinket_id"
  end

  create_table "trinkets", force: :cascade do |t|
    t.integer "favorite_id", null: false
    t.float "price", default: 10.0
    t.string "product_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favorite_id"], name: "index_trinkets_on_favorite_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "blanks", "madlibs"
  add_foreign_key "favorites", "madlibs"
  add_foreign_key "favorites", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "trinket_orders", "orders"
  add_foreign_key "trinket_orders", "trinkets"
  add_foreign_key "trinkets", "favorites"
end
