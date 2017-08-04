class AddEmployeeIdToProstheses < ActiveRecord::Migration
  def change
    add_reference :prostheses, :employee, index: true, foreign_key: true
  end
end
