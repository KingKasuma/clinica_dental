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

##########Roles#########
rol1 = Role.create! :nombre => "Paciente", :descripcion => 'Es el paciente de la clinica dental'
rol2 = Role.create! :nombre => "Odontologo", :descripcion => 'Persona que se encarga de atender los malestares de los pacientes'
rol3 = Role.create! :nombre => "Protesista", :descripcion => 'Persona que se encarga de realizar las protesis'
rol4 = Role.create! :nombre => "Secretaria", :descripcion => 'Persona que se encarga de recepcionar a los pacientes'
##########Roles#########


################Examenes Dentales##############
de18 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '18'
de17 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '17'
de16 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '16'
de15 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '15'
de14 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '14'
de13 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '13'
de12 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '12'
de11 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '11'
de55 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '55'
de54 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '54'
de53 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '53'
de52 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '52'
de51 = DentalExamination.create! :posicion => 'superior derecha', :numero_diente => '51'
de21 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '21'
de22 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '22'
de23 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '23'
de24 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '24'
de25 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '25'
de26 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '26'
de27 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '27'
de28 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '28'
de61 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '61'
de62 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '62'
de63 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '63'
de64 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '64'
de65 = DentalExamination.create! :posicion => 'superior izquierda', :numero_diente => '65'
de38 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '38'
de37 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '37'
de36 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '36'
de35 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '35'
de34 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '34'
de33 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '33'
de32 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '32'
de31 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '31'
de74 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '74'
de73 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '73'
de72 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '72'
de71 = DentalExamination.create! :posicion => 'inferior izquierda', :numero_diente => '71'
de41 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '41'
de42 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '42'
de43 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '43'
de44 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '44'
de45 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '45'
de46 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '46'
de47 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '47'
de48 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '48'
de81 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '81'
de82 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '82'
de83 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '83'
de84 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '84'
de85 = DentalExamination.create! :posicion => 'inferior derecha', :numero_diente => '85'
################Examenes Dentales##############
