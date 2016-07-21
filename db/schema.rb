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

ActiveRecord::Schema.define(version: 20160721065907) do

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "parent_id"
  end

  create_table "discussion_threads", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "board_id"
    t.integer  "author_id"
    t.index ["author_id"], name: "index_discussion_threads_on_author_id"
    t.index ["board_id"], name: "index_discussion_threads_on_board_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "author_id"
    t.integer  "thread_id"
    t.index ["author_id"], name: "index_posts_on_author_id"
    t.index ["thread_id"], name: "index_posts_on_thread_id"
  end

  create_table "thread_views", force: :cascade do |t|
    t.integer  "thread_id"
    t.integer  "viewer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thread_id"], name: "index_thread_views_on_thread_id"
    t.index ["viewer_id", "thread_id"], name: "index_thread_views_on_viewer_id_and_thread_id", unique: true
    t.index ["viewer_id"], name: "index_thread_views_on_viewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "email_address"
    t.string   "password_digest"
    t.string   "name"
    t.boolean  "is_admin"
  end

end
