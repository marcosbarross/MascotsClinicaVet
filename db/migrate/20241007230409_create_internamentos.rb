class CreateInternamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :internamentos do |t|
      t.references :consulta, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_fim
      t.string :medicamento
      t.float :quantidade_medicamento
      t.text :obs_monitoramento

      t.timestamps
    end
  end
end
