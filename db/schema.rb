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

ActiveRecord::Schema.define(version: 20171018033614) do

  create_table "node_comments", force: :cascade do |t|
    t.integer "node_id"
    t.integer "to_comment_id"
    t.text "content"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nodes", force: :cascade do |t|
    t.integer "tree_id"
    t.integer "clone_from_node_id"
    t.string "title"
    t.text "content"
    t.integer "creator_id"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "region_users", force: :cascade do |t|
    t.integer "region_id"
    t.integer "user_id"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.integer "parent_id", default: 0
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_configs", force: :cascade do |t|
    t.text "fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tree_nodes", force: :cascade do |t|
    t.integer "tree_id"
    t.integer "node_id"
    t.integer "sequence", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tree_users", force: :cascade do |t|
    t.integer "tree_id"
    t.integer "user_id"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trees", force: :cascade do |t|
    t.integer "region_id"
    t.string "title"
    t.text "content"
    t.integer "creator_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "account"
    t.string "email"
    t.string "name"
    t.string "password"
    t.integer "group", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
