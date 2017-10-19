class AddFechaToDebt < ActiveRecord::Migration
  def change
    add_column :debts, :fecha, :date
  end
end
