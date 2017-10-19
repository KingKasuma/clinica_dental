class AddFechaEntregaToProsthesis < ActiveRecord::Migration
  def change
    add_column :prostheses, :fecha_entrega, :date
  end
end
