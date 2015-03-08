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

ActiveRecord::Schema.define(version: 20150307234937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiments", force: :cascade do |t|
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "processed"
  end

  create_table "phone_acc_data", force: :cascade do |t|
    t.integer "experiment_id"
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.integer "ts",            limit: 8
  end

  add_index "phone_acc_data", ["experiment_id"], name: "index_phone_acc_data_on_experiment_id", using: :btree

  create_table "phone_gyr_data", force: :cascade do |t|
    t.integer "experiment_id"
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.integer "ts",            limit: 8
  end

  add_index "phone_gyr_data", ["experiment_id"], name: "index_phone_gyr_data_on_experiment_id", using: :btree

  create_table "strap_acc_data", force: :cascade do |t|
    t.integer "experiment_id"
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.integer "ts",            limit: 8
  end

  add_index "strap_acc_data", ["experiment_id"], name: "index_strap_acc_data_on_experiment_id", using: :btree

  add_foreign_key "phone_acc_data", "experiments"
  add_foreign_key "phone_gyr_data", "experiments"
  add_foreign_key "strap_acc_data", "experiments"
end
