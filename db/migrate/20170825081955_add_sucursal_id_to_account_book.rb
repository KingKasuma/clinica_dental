class AddSucursalIdToAccountBook < ActiveRecord::Migration
  def change
    add_reference :account_books, :sucursal, index: true, foreign_key: true
  end
end
