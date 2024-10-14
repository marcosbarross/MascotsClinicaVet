json.extract! estoque_venda, :id, :medicamento, :preco, :quantidade_disponivel, :quantidade_venda, :fornecedor, :created_at, :updated_at
json.url estoque_venda_url(estoque_venda, format: :json)
