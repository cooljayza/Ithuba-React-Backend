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

ActiveRecord::Schema[7.1].define(version: 2023_10_09_062050) do
  create_table "lotto_dividends", force: :cascade do |t|
    t.integer "lotto_set_id"
    t.integer "rank"
    t.decimal "share_value"
    t.decimal "num_of_shares"
    t.decimal "amount_paid"
    t.decimal "next_draw_rollover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lotto_set_id"], name: "index_lotto_dividends_on_lotto_set_id"
  end

  create_table "lotto_draws", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.integer "draw_id"
    t.integer "sequence_number"
    t.integer "roll_over_number"
    t.datetime "draw_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lotto_sets", force: :cascade do |t|
    t.integer "lotto_draw_id"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lotto_draw_id"], name: "index_lotto_sets_on_lotto_draw_id"
  end

  add_foreign_key "lotto_dividends", "lotto_sets"
  add_foreign_key "lotto_sets", "lotto_draws"
end
