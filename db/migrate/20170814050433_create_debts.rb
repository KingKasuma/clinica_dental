class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.float :pago
      t.float :saldo
      t.float :total
      t.references :account_book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
