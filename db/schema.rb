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

ActiveRecord::Schema.define(version: 2021_08_06_124949) do

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "password_digest"
    t.string "remember_digest"
  end

  create_table "temperatures", force: :cascade do |t|
    t.string "num"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_temperatures_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_temperatures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["group_id", "created_at"], name: "index_users_on_group_id_and_created_at"
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  add_foreign_key "temperatures", "users"
  add_foreign_key "users", "groups"
end
