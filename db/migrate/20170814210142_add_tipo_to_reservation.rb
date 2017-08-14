class AddTipoToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :tipo, :string
  end
end
