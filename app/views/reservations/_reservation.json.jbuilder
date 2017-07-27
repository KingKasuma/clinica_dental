json.extract! reservation, :id, :nombre, :descripcion, :employee_id, :patient_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
