json.extract! exame, :id, :consulta_id, :nome_exame, :status_exame, :resultado, :created_at, :updated_at
json.url exame_url(exame, format: :json)
