class RemoveNombreFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :nombre, :string
  end
end
