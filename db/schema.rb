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

ActiveRecord::Schema.define(version: 20170726143740) do

  create_table "employees", force: :cascade do |t|
    t.string   "nombre",           limit: 255
    t.string   "apellido_paterno", limit: 255
    t.string   "apellido_materno", limit: 255
    t.date     "fecha_nacimiento"
    t.string   "genero",           limit: 255
    t.string   "nacionalidad",     limit: 255
    t.string   "profesion",        limit: 255
    t.text     "especialidad",     limit: 65535
    t.date     "fecha_alta"
    t.date     "fecha_baja"
    t.string   "CI",               limit: 255
    t.string   "email",            limit: 255
    t.integer  "sucursal",         limit: 4
    t.integer  "role_id",          limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "cargo",            limit: 255
  end

  add_index "employees", ["role_id"], name: "index_employees_on_role_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "nombres",           limit: 255
    t.string   "apellido_paterno",  limit: 255
    t.string   "apellido_materno",  limit: 255
    t.integer  "edad",              limit: 4
    t.string   "ocupacion",         limit: 255
    t.string   "procedencia",       limit: 255
    t.text     "direccion",         limit: 65535
    t.string   "tiempo_disponible", limit: 255
    t.integer  "telefono",          limit: 4
    t.string   "email",             limit: 255
    t.string   "CI",                limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "role_id",           limit: 4
  end

  add_index "patients", ["role_id"], name: "index_patients_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "username",               limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "employee_id",            limit: 4
    t.integer  "patient_id",             limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["employee_id"], name: "index_users_on_employee_id", using: :btree
  add_index "users", ["patient_id"], name: "index_users_on_patient_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "employees", "roles"
  add_foreign_key "patients", "roles"
  add_foreign_key "users", "employees"
  add_foreign_key "users", "patients"
end
