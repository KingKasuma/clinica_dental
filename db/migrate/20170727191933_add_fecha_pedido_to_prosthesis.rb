class AddFechaPedidoToProsthesis < ActiveRecord::Migration
  def change
    add_column :prostheses, :fecha_pedido, :date
  end
end
