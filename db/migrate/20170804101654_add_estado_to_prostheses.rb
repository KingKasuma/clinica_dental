class AddEstadoToProstheses < ActiveRecord::Migration
  def change
    add_column :prostheses, :estado, :string
  end
end
