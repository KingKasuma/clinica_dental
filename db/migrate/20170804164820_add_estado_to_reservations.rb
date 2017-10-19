class AddEstadoToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :estado, :string
  end
end
