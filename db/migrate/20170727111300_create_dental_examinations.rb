class CreateDentalExaminations < ActiveRecord::Migration
  def change
    create_table :dental_examinations do |t|
      t.string :posicion
      t.integer :numero_diente

      t.timestamps null: false
    end
  end
end
