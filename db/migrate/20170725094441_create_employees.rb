class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.date :fecha_nacimiento
      t.string :genero
      t.string :nacionalidad
      t.string :profesion
      t.text :especialidad
      t.date :fecha_alta
      t.date :fecha_baja
      t.string :CI
      t.string :email
      t.integer :sucursal
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
