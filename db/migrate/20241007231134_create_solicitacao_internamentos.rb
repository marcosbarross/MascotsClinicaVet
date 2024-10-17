class CreateSolicitacaoInternamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :solicitacao_internamentos do |t|
      t.references :consulta, null: false, foreign_key: true
      t.date :data_solicitacao
      t.text :observacao

      t.timestamps
    end
  end
end
