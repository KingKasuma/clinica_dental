class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :nombre
      t.text :descripcion
      t.references :employee, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
