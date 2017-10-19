class RemoveDescripcionFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :descripcion, :text
  end
end
