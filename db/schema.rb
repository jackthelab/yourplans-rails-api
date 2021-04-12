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

ActiveRecord::Schema.define(version: 2021_04_12_184939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bid_responses", force: :cascade do |t|
    t.bigint "business_id", null: false
    t.bigint "bid_id", null: false
    t.integer "price"
    t.string "category"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bid_id"], name: "index_bid_responses_on_bid_id"
    t.index ["business_id"], name: "index_bid_responses_on_business_id"
  end

  create_table "bids", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "city"
    t.string "state"
    t.integer "budget"
    t.integer "num_in_party"
    t.text "notes"
    t.boolean "open_status"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.string "twitter"
    t.string "facebook"
    t.string "instagram"
    t.string "linkedin"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "bid_id", null: false
    t.bigint "bid_response_id", null: false
    t.boolean "complete"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bid_id"], name: "index_experiences_on_bid_id"
    t.index ["bid_response_id"], name: "index_experiences_on_bid_response_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "experience_id", null: false
    t.integer "rating"
    t.text "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["experience_id"], name: "index_reviews_on_experience_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bid_responses", "bids"
  add_foreign_key "bid_responses", "businesses"
  add_foreign_key "bids", "users"
  add_foreign_key "experiences", "bid_responses"
  add_foreign_key "experiences", "bids"
  add_foreign_key "reviews", "experiences"
end
