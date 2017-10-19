class AddCargoToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :cargo, :string
  end
end
