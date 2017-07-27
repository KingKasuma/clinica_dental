# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#a = Role.create! :nombre => 'Administrador', :descripcion => 'Tiene acceso a todo'
#b = Employee.create! :nombre => 'Michael King', :apellido_paterno => 'Gutierrez', :apellido_materno => 'Maldonado', :fecha_nacimiento => Date.new(1991,8,24), :genero => 'Masculino', :nacionalidad => 'Boliviano', :profesion => 'Estudiante', :especialidad => 'Cirujano', :fecha_alta => Date.today, :fecha_baja => Date.today, :CI => '8047284', :email => 'michael@gmail.com', :role_id => a.id
#c = User.create! :email => b.email, :password => b.CI, :password_confirmation => b.CI, :username => b.nombre, :employee_id => b.id

a = User.create! :email => "michael@example.com", :password => '8047284', :password_confirmation => '8047284', :username => 'Michael Gutierrez'
