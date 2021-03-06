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

ActiveRecord::Schema.define(version: 20160114093859) do

  create_table "category", force: :cascade do |t|
    t.string "name", limit: 50, null: false
  end

  add_index "category", ["name"], name: "UNIQ_64C19C15E237E06", unique: true, using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "post", force: :cascade do |t|
    t.string   "title",   limit: 100,        null: false
    t.text     "content", limit: 4294967295, null: false
    t.datetime "created",                    null: false
    t.datetime "updated"
    t.integer  "user_id", limit: 4
    t.string   "slug",    limit: 128,        null: false
  end

  add_index "post", ["slug"], name: "UNIQ_5A8A6C8D989D9B62", unique: true, using: :btree
  add_index "post", ["user_id"], name: "IDX_5A8A6C8DA76ED395", using: :btree

  create_table "post_category", id: false, force: :cascade do |t|
    t.integer "post_id",     limit: 4, null: false
    t.integer "category_id", limit: 4, null: false
  end

  add_index "post_category", ["category_id"], name: "IDX_B9A1906012469DE2", using: :btree
  add_index "post_category", ["post_id"], name: "IDX_B9A190604B89032C", using: :btree

  create_table "user", force: :cascade do |t|
    t.string "username", limit: 99,  null: false
    t.string "password", limit: 255, null: false
    t.string "role",     limit: 255, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "username",  limit: 50,         null: false
    t.string  "password",  limit: 255,        null: false
    t.string  "salt",      limit: 255,        null: false
    t.string  "mail",      limit: 255,        null: false
    t.text    "roles",     limit: 4294967295
    t.boolean "is_active"
  end

  add_index "users", ["username"], name: "UNIQ_1483A5E9F85E0677", unique: true, using: :btree

  add_foreign_key "post", "users", name: "FK_5A8A6C8DA76ED395", on_delete: :nullify
  add_foreign_key "post_category", "category", name: "FK_B9A1906012469DE2", on_delete: :cascade
  add_foreign_key "post_category", "post", name: "FK_B9A190604B89032C", on_delete: :cascade
end
