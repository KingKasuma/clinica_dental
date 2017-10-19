class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :nombre
      t.text :tratamiento
      t.float :costo
      t.text :diagnostico_presuntivo
      t.text :diagnostico_definitivo
      t.boolean :rayos_x
      t.references :employee, index: true, foreign_key: true
      t.references :medical_history, index: true, foreign_key: true
      t.references :dental_examination, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
