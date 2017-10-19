class CreateMedicalHistories < ActiveRecord::Migration
  def change
    create_table :medical_histories do |t|
      t.boolean :tratamiento_medico
      t.boolean :medicamentos_actuales
      t.boolean :enfermo_corazon
      t.boolean :desmayos_frecuencia
      t.boolean :intervenido_quirurgicamente
      t.boolean :complicaciones_hemorragias
      t.text :observaciones
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
