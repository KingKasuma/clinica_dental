json.extract! medical_history, :id, :tratamiento_medico, :medicamentos_actuales, :enfermo_corazon, :desmayos_frecuencia, :intervenido_quirurgicamente, :complicaciones_hemorragias, :observaciones, :patient_id, :created_at, :updated_at
json.url medical_history_url(medical_history, format: :json)
