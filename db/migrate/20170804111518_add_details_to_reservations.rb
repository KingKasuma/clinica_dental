class AddDetailsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :fecha, :date
    add_column :reservations, :hora, :time
  end
end
