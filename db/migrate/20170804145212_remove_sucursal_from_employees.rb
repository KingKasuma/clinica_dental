class RemoveSucursalFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :sucursal, :integer
  end
end
