json.extract! prescricao_medica, :id, :consulta_id, :data, :medicamentos_prescritos, :dosagens, :observacao, :created_at, :updated_at
json.url prescricao_medica_url(prescricao_medica, format: :json)
