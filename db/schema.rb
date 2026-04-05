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

ActiveRecord::Schema[8.0].define(version: 2026_04_05_121213) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "attempts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "problem_id", null: false
    t.text "user_answer"
    t.boolean "is_correct"
    t.datetime "solved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "time_spent"
    t.boolean "shown_solution"
    t.index ["problem_id"], name: "index_attempts_on_problem_id"
    t.index ["user_id"], name: "index_attempts_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "problem_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_favorites_on_problem_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "solution"
    t.integer "difficulty"
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_published", default: true
    t.string "correct_answer"
    t.string "problem_type"
    t.bigint "subtopic_id", null: false
    t.index ["subtopic_id"], name: "index_problems_on_subtopic_id"
    t.index ["topic_id"], name: "index_problems_on_topic_id"
  end

  create_table "reference_materials", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_reference_materials_on_topic_id"
  end

  create_table "subtopics", force: :cascade do |t|
    t.string "title"
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_subtopics_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attempts", "problems"
  add_foreign_key "attempts", "users"
  add_foreign_key "favorites", "problems"
  add_foreign_key "favorites", "users"
  add_foreign_key "problems", "subtopics"
  add_foreign_key "problems", "topics"
  add_foreign_key "reference_materials", "topics"
  add_foreign_key "subtopics", "topics"
end
