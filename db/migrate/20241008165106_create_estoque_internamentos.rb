class CreateEstoqueInternamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :estoque_internamentos do |t|
      t.references :internamento, null: false, foreign_key: true
      t.string :medicamento
      t.float :quantidade_disponivel
      t.float :quantidade_utilizada
      t.float :quantidade_minima
      t.string :fornecedor

      t.timestamps
    end
  end
end
