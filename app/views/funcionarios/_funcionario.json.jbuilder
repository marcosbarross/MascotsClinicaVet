json.extract! funcionario, :id, :nome, :contato, :cargo, :login, :senha, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
