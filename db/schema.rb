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

ActiveRecord::Schema.define(version: 20171018115349) do

  create_table "account_books", force: :cascade do |t|
    t.text     "descripcion"
    t.string   "estado"
    t.integer  "patient_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sucursal_id"
  end

  add_index "account_books", ["patient_id"], name: "index_account_books_on_patient_id"
  add_index "account_books", ["sucursal_id"], name: "index_account_books_on_sucursal_id"

  create_table "debts", force: :cascade do |t|
    t.float    "pago"
    t.float    "saldo"
    t.float    "total"
    t.integer  "account_book_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "fecha"
  end

  add_index "debts", ["account_book_id"], name: "index_debts_on_account_book_id"

  create_table "dental_examinations", force: :cascade do |t|
    t.string   "posicion"
    t.integer  "numero_diente"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.date     "fecha_nacimiento"
    t.string   "genero"
    t.string   "nacionalidad"
    t.string   "profesion"
    t.text     "especialidad"
    t.date     "fecha_alta"
    t.date     "fecha_baja"
    t.string   "CI"
    t.string   "email"
    t.integer  "role_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "cargo"
    t.integer  "sucursal_id"
  end

  add_index "employees", ["role_id"], name: "index_employees_on_role_id"
  add_index "employees", ["sucursal_id"], name: "index_employees_on_sucursal_id"

  create_table "medical_histories", force: :cascade do |t|
    t.boolean  "tratamiento_medico"
    t.boolean  "medicamentos_actuales"
    t.boolean  "enfermo_corazon"
    t.boolean  "desmayos_frecuencia"
    t.boolean  "intervenido_quirurgicamente"
    t.boolean  "complicaciones_hemorragias"
    t.text     "observaciones"
    t.integer  "patient_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "medical_histories", ["patient_id"], name: "index_medical_histories_on_patient_id"

  create_table "patients", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.integer  "edad"
    t.string   "ocupacion"
    t.string   "procedencia"
    t.text     "direccion"
    t.string   "tiempo_disponible"
    t.integer  "telefono"
    t.string   "email"
    t.string   "CI"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "role_id"
  end

  add_index "patients", ["role_id"], name: "index_patients_on_role_id"

  create_table "prostheses", force: :cascade do |t|
    t.string   "nombre"
    t.text     "protesis"
    t.float    "costo"
    t.integer  "treatment_id"
    t.integer  "medical_history_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.date     "fecha_pedido"
    t.date     "fecha_entrega"
    t.integer  "employee_id"
    t.string   "estado"
  end

  add_index "prostheses", ["employee_id"], name: "index_prostheses_on_employee_id"
  add_index "prostheses", ["medical_history_id"], name: "index_prostheses_on_medical_history_id"
  add_index "prostheses", ["treatment_id"], name: "index_prostheses_on_treatment_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "patient_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "fecha"
    t.time     "hora"
    t.string   "estado"
    t.string   "tipo"
  end

  add_index "reservations", ["employee_id"], name: "index_reservations_on_employee_id"
  add_index "reservations", ["patient_id"], name: "index_reservations_on_patient_id"

  create_table "roles", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sucursals", force: :cascade do |t|
    t.text     "direccion"
    t.integer  "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.string   "nombre"
    t.text     "tratamiento"
    t.float    "costo"
    t.text     "diagnostico_presuntivo"
    t.text     "diagnostico_definitivo"
    t.boolean  "rayos_x"
    t.integer  "employee_id"
    t.integer  "medical_history_id"
    t.integer  "dental_examination_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.date     "fecha"
  end

  add_index "treatments", ["dental_examination_id"], name: "index_treatments_on_dental_examination_id"
  add_index "treatments", ["employee_id"], name: "index_treatments_on_employee_id"
  add_index "treatments", ["medical_history_id"], name: "index_treatments_on_medical_history_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "employee_id"
    t.integer  "patient_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["employee_id"], name: "index_users_on_employee_id"
  add_index "users", ["patient_id"], name: "index_users_on_patient_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
