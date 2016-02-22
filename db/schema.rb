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

ActiveRecord::Schema.define(version: 20160222165540) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["name"], name: "index_courses_on_name", unique: true

  create_table "exam_versions", force: :cascade do |t|
    t.string   "name"
    t.integer  "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exam_versions", ["exam_id"], name: "index_exam_versions_on_exam_id"

  create_table "exams", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "courses_id"
  end

  add_index "exams", ["user_id"], name: "index_exams_on_user_id"

  create_table "question_memberships", force: :cascade do |t|
    t.integer  "exam_version_id"
    t.integer  "question_id"
    t.integer  "number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "question_memberships", ["exam_version_id"], name: "index_question_memberships_on_exam_version_id"
  add_index "question_memberships", ["question_id"], name: "index_question_memberships_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "number"
    t.text     "text"
    t.integer  "points"
    t.integer  "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "answer"
  end

  add_index "questions", ["exam_id"], name: "index_questions_on_exam_id"

  create_table "test_versions", force: :cascade do |t|
    t.string   "name"
    t.integer  "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "test_versions", ["exam_id"], name: "index_test_versions_on_exam_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "api_key"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
