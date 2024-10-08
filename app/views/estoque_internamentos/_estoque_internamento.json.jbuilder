json.extract! estoque_internamento, :id, :solicitacao_internamento_id, :medicamento, :quantidade_disponivel, :quantidade_utilizada, :quantidade_minima, :fornecedor, :created_at, :updated_at
json.url estoque_internamento_url(estoque_internamento, format: :json)
