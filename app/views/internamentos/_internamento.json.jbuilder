json.extract! internamento, :id, :consulta_id, :data_inicio, :data_fim, :medicamento, :quantidade_medicamento, :obs_monitoramento, :created_at, :updated_at
json.url internamento_url(internamento, format: :json)
