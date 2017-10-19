json.extract! patient, :id, :nombres, :apellido_paterno, :apellido_materno, :edad, :ocupacion, :procedencia, :direccion, :tiempo_disponible, :telefono, :email, :CI, :created_at, :updated_at
json.url patient_url(patient, format: :json)
