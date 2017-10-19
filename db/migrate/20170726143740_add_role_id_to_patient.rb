class AddRoleIdToPatient < ActiveRecord::Migration
  def change
    add_reference :patients, :role, index: true, foreign_key: true
  end
end
