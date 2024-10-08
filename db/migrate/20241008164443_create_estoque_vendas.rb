class CreateEstoqueVendas < ActiveRecord::Migration[7.1]
  def change
    create_table :estoque_vendas do |t|
      t.string :medicamento
      t.decimal :preco
      t.integer :quantidade_disponivel
      t.integer :quantidade_venda
      t.string :fornecedor

      t.timestamps
    end
  end
end
