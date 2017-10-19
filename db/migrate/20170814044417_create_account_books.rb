class CreateAccountBooks < ActiveRecord::Migration
  def change
    create_table :account_books do |t|
      t.text :descripcion
      t.string :estado
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
