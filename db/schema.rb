# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_18_111109) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.text "category_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupon_categories", force: :cascade do |t|
    t.bigint "coupon_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_coupon_categories_on_category_id"
    t.index ["coupon_id"], name: "index_coupon_categories_on_coupon_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.string "coupon_code"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "cashback_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_coupons_on_store_id"
  end

  create_table "discount_categories", force: :cascade do |t|
    t.bigint "discount_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_discount_categories_on_category_id"
    t.index ["discount_id"], name: "index_discount_categories_on_discount_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.text "description"
    t.integer "discount_percentage"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "cashback_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_discounts_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "store_name"
    t.string "store_url"
    t.string "store_logo"
    t.text "store_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_cashbacks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "cashback_amount"
    t.bigint "coupon_id", null: false
    t.bigint "discount_id", null: false
    t.datetime "transaction_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_user_cashbacks_on_coupon_id"
    t.index ["discount_id"], name: "index_user_cashbacks_on_discount_id"
    t.index ["user_id"], name: "index_user_cashbacks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coupon_categories", "categories"
  add_foreign_key "coupon_categories", "coupons"
  add_foreign_key "coupons", "stores"
  add_foreign_key "discount_categories", "categories"
  add_foreign_key "discount_categories", "discounts"
  add_foreign_key "discounts", "stores"
  add_foreign_key "user_cashbacks", "coupons"
  add_foreign_key "user_cashbacks", "discounts"
  add_foreign_key "user_cashbacks", "users"
end
