class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :nombres
      t.string :apellido_paterno
      t.string :apellido_materno
      t.integer :edad
      t.string :ocupacion
      t.string :procedencia
      t.text :direccion
      t.string :tiempo_disponible
      t.integer :telefono
      t.string :email
      t.string :CI

      t.timestamps null: false
    end
  end
end
