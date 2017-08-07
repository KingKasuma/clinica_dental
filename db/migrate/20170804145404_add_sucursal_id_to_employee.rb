class AddSucursalIdToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :sucursal, index: true, foreign_key: true
  end
end
