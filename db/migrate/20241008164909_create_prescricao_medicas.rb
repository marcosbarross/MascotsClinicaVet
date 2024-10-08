class CreatePrescricaoMedicas < ActiveRecord::Migration[7.1]
  def change
    create_table :prescricao_medicas do |t|
      t.references :consulta, null: false, foreign_key: true
      t.date :data
      t.string :medicamentos_prescritos
      t.string :dosagens
      t.text :observacao

      t.timestamps
    end
  end
end
