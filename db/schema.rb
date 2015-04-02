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

ActiveRecord::Schema.define(version: 20150402000005) do

  create_table "found_files", force: :cascade do |t|
    t.string   "found_file_path"
    t.text     "search_term_list"
    t.integer  "search_term_count"
    t.integer  "result_entry_count"
    t.integer  "file_line_count"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "found_lines", force: :cascade do |t|
    t.integer  "found_file_id"
    t.integer  "found_line_num"
    t.string   "found_line_string"
    t.text     "search_term_list"
    t.integer  "search_term_count"
    t.integer  "result_entry_count"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "grep_multis", force: :cascade do |t|
    t.text     "search_terms"
    t.text     "search_paths"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "grep_raws", force: :cascade do |t|
    t.integer  "grep_multi_id"
    t.string   "search_term"
    t.string   "search_path"
    t.string   "cmd"
    t.text     "result_set"
    t.text     "error_log"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "grep_result_entries", force: :cascade do |t|
    t.integer  "grep_raw_id"
    t.integer  "found_file_id"
    t.integer  "found_line_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
