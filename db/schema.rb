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

ActiveRecord::Schema.define(version: 20170803175715) do

  create_table "requests", force: :cascade do |t|
    t.integer  "creditor_id"
    t.integer  "debtor_id"
    t.string   "line_item_name"
    t.decimal  "amount",                      precision: 8, scale: 2
    t.string   "comment"
    t.boolean  "acknowledged_request_status"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["creditor_id"], name: "index_requests_on_creditor_id"
    t.index ["debtor_id"], name: "index_requests_on_debtor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "activation_token"
    t.index ["activation_token"], name: "index_users_on_activation_token", unique: true
  end

end
