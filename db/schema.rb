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

ActiveRecord::Schema.define(version: 20141201004743) do

  create_table "educations", force: true do |t|
    t.string   "institution"
    t.string   "degree"
    t.text     "desc"
    t.date     "start"
    t.date     "end"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "educations", ["resume_id"], name: "index_educations_on_resume_id"

  create_table "multi_line_list_items", force: true do |t|
    t.string   "line1"
    t.string   "line2"
    t.text     "desc"
    t.date     "start"
    t.date     "end"
    t.integer  "multi_line_line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "multi_line_list_items", ["multi_line_line_id"], name: "index_multi_line_list_items_on_multi_line_line_id"

  create_table "multi_line_lists", force: true do |t|
    t.string   "name"
    t.integer  "order"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "multi_line_lists", ["resume_id"], name: "index_multi_line_lists_on_resume_id"

  create_table "multiline_list_items", force: true do |t|
    t.string   "line1"
    t.string   "line2"
    t.text     "desc"
    t.date     "start"
    t.date     "end"
    t.integer  "multiline_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "multiline_list_items", ["multiline_list_id"], name: "index_multiline_list_items_on_multiline_list_id"

  create_table "multiline_lists", force: true do |t|
    t.string   "name"
    t.integer  "order"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "multiline_lists", ["resume_id"], name: "index_multiline_lists_on_resume_id"

  create_table "personal_details", force: true do |t|
    t.string   "name"
    t.string   "fax"
    t.string   "phone"
    t.string   "address"
    t.string   "picture"
    t.string   "email"
    t.string   "website"
    t.boolean  "sex"
    t.string   "nationality"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resume_id"
  end

  add_index "personal_details", ["resume_id"], name: "index_personal_details_on_resume_id"

  create_table "resumes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simplelistitems", force: true do |t|
    t.string   "content"
    t.integer  "simplelist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simplelistitems", ["simplelist_id"], name: "index_simplelistitems_on_simplelist_id"

  create_table "simplelists", force: true do |t|
    t.string   "name"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simplelists", ["resume_id"], name: "index_simplelists_on_resume_id"

  create_table "works", force: true do |t|
    t.string   "company"
    t.string   "position"
    t.text     "desc"
    t.date     "start"
    t.date     "end"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "works", ["resume_id"], name: "index_works_on_resume_id"

end
