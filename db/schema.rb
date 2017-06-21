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

ActiveRecord::Schema.define(version: 20170621145637) do

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "clients", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "streetname"
    t.string "aptnumber"
    t.string "borough"
    t.string "notes"
  end

  create_table "job_clients", force: :cascade do |t|
    t.integer "job_id"
    t.integer "client_id"
    t.index ["client_id"], name: "index_job_clients_on_client_id"
    t.index ["job_id"], name: "index_job_clients_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.date "jobdate"
    t.integer "payrate"
    t.integer "category_id"
    t.boolean "paid"
    t.string "equipment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
