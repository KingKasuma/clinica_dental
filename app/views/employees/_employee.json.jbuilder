json.extract! employee, :id, :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :genero, :nacionalidad, :profesion, :especialidad, :fecha_alta, :fecha_baja, :CI, :email, :sucursal, :role_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
