class CreateProstheses < ActiveRecord::Migration
  def change
    create_table :prostheses do |t|
      t.string :nombre
      t.text :protesis
      t.float :costo
      t.references :treatment, index: true, foreign_key: true
      t.references :medical_history, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
