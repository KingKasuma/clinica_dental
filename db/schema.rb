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

ActiveRecord::Schema.define(version: 20170804164820) do

  create_table "dental_examinations", force: :cascade do |t|
    t.string   "posicion",      limit: 255
    t.integer  "numero_diente", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

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
    t.integer  "role_id",          limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "cargo",            limit: 255
    t.integer  "sucursal_id",      limit: 4
  end

  add_index "employees", ["role_id"], name: "index_employees_on_role_id", using: :btree
  add_index "employees", ["sucursal_id"], name: "index_employees_on_sucursal_id", using: :btree

  create_table "medical_histories", force: :cascade do |t|
    t.boolean  "tratamiento_medico"
    t.boolean  "medicamentos_actuales"
    t.boolean  "enfermo_corazon"
    t.boolean  "desmayos_frecuencia"
    t.boolean  "intervenido_quirurgicamente"
    t.boolean  "complicaciones_hemorragias"
    t.text     "observaciones",               limit: 65535
    t.integer  "patient_id",                  limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "medical_histories", ["patient_id"], name: "index_medical_histories_on_patient_id", using: :btree

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

  create_table "prostheses", force: :cascade do |t|
    t.string   "nombre",             limit: 255
    t.text     "protesis",           limit: 65535
    t.float    "costo",              limit: 24
    t.integer  "treatment_id",       limit: 4
    t.integer  "medical_history_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.date     "fecha_pedido"
    t.date     "fecha_entrega"
    t.integer  "employee_id",        limit: 4
    t.string   "estado",             limit: 255
  end

  add_index "prostheses", ["employee_id"], name: "index_prostheses_on_employee_id", using: :btree
  add_index "prostheses", ["medical_history_id"], name: "index_prostheses_on_medical_history_id", using: :btree
  add_index "prostheses", ["treatment_id"], name: "index_prostheses_on_treatment_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.integer  "patient_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "fecha"
    t.time     "hora"
    t.string   "estado",      limit: 255
  end

  add_index "reservations", ["employee_id"], name: "index_reservations_on_employee_id", using: :btree
  add_index "reservations", ["patient_id"], name: "index_reservations_on_patient_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sucursals", force: :cascade do |t|
    t.text     "direccion",  limit: 65535
    t.integer  "telefono",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.string   "nombre",                 limit: 255
    t.text     "tratamiento",            limit: 65535
    t.float    "costo",                  limit: 24
    t.text     "diagnostico_presuntivo", limit: 65535
    t.text     "diagnostico_definitivo", limit: 65535
    t.boolean  "rayos_x"
    t.integer  "employee_id",            limit: 4
    t.integer  "medical_history_id",     limit: 4
    t.integer  "dental_examination_id",  limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "treatments", ["dental_examination_id"], name: "index_treatments_on_dental_examination_id", using: :btree
  add_index "treatments", ["employee_id"], name: "index_treatments_on_employee_id", using: :btree
  add_index "treatments", ["medical_history_id"], name: "index_treatments_on_medical_history_id", using: :btree

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
  add_foreign_key "employees", "sucursals"
  add_foreign_key "medical_histories", "patients"
  add_foreign_key "patients", "roles"
  add_foreign_key "prostheses", "employees"
  add_foreign_key "prostheses", "medical_histories"
  add_foreign_key "prostheses", "treatments"
  add_foreign_key "reservations", "employees"
  add_foreign_key "reservations", "patients"
  add_foreign_key "treatments", "dental_examinations"
  add_foreign_key "treatments", "employees"
  add_foreign_key "treatments", "medical_histories"
  add_foreign_key "users", "employees"
  add_foreign_key "users", "patients"
end
