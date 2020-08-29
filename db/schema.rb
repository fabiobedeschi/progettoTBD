# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_29_141921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.date "dod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bio"
  end

  create_table "authors_libraries", id: false, force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "library_id", null: false
    t.index ["author_id", "library_id"], name: "index_authors_libraries_on_author_id_and_library_id"
    t.index ["library_id", "author_id"], name: "index_authors_libraries_on_library_id_and_author_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "plot"
    t.date "dop"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "books_libraries", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "library_id", null: false
    t.index ["book_id", "library_id"], name: "index_books_libraries_on_book_id_and_library_id"
    t.index ["library_id", "book_id"], name: "index_books_libraries_on_library_id_and_book_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_libraries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin", default: false, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comments", "books"
  add_foreign_key "comments", "users"
  add_foreign_key "libraries", "users"
end
