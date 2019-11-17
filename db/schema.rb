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

ActiveRecord::Schema.define(version: 20191117035347) do

  create_table "films", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "director"
    t.string   "image"
    t.date     "release_date"
    t.string   "original_title"
    t.string   "lang"
    t.text     "description",    limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "image"
    t.boolean  "admin",           default: false
  end

  create_table "watch_relations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "film_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "rate"
    t.text     "comment",    limit: 65535
    t.index ["film_id"], name: "index_watch_relations_on_film_id", using: :btree
    t.index ["user_id", "film_id"], name: "index_watch_relations_on_user_id_and_film_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_watch_relations_on_user_id", using: :btree
  end

  add_foreign_key "watch_relations", "films"
  add_foreign_key "watch_relations", "users"
end
