json.extract! tutor, :id, :nome, :endereco, :telefone, :email, :created_at, :updated_at
json.url tutor_url(tutor, format: :json)
