class CreateSucursals < ActiveRecord::Migration
  def change
    create_table :sucursals do |t|
      t.text :direccion
      t.integer :telefono

      t.timestamps null: false
    end
  end
end
