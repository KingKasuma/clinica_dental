class AddFechaToTreatment < ActiveRecord::Migration
  def change
    add_column :treatments, :fecha, :date
  end
end
