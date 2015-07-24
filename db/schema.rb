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

ActiveRecord::Schema.define(version: 20150724033735) do

  create_table "applicants", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.integer  "vacancy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "applicants", ["vacancy_id"], name: "index_applicants_on_vacancy_id"

  create_table "applicants_vacancies", force: :cascade do |t|
    t.integer "vacancy_id"
    t.integer "applicant_id"
  end

  add_index "applicants_vacancies", ["applicant_id"], name: "index_applicants_vacancies_on_applicant_id"
  add_index "applicants_vacancies", ["vacancy_id"], name: "index_applicants_vacancies_on_vacancy_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["company_id"], name: "index_positions_on_company_id"

  create_table "vacancies", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "description"
    t.integer  "company_id"
    t.integer  "applicant_id"
    t.integer  "position_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "vacancies", ["applicant_id"], name: "index_vacancies_on_applicant_id"
  add_index "vacancies", ["company_id"], name: "index_vacancies_on_company_id"
  add_index "vacancies", ["position_id"], name: "index_vacancies_on_position_id"

end
