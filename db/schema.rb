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

ActiveRecord::Schema.define(version: 2021_08_12_150759) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id_id"
    t.bigint "id_id"
    t.index ["category_id_id"], name: "index_categories_on_category_id_id"
    t.index ["id_id"], name: "index_categories_on_id_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "tag"
    t.bigint "users_id"
    t.bigint "categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_posts_on_categories_id"
    t.index ["users_id"], name: "index_posts_on_users_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "username"
    t.string "fullname"
    t.string "password_digest"
    t.string "email"
    t.string "address"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
  end

  add_foreign_key "posts", "categories", column: "categories_id"
  add_foreign_key "posts", "users", column: "users_id"
end
