class CreateExames < ActiveRecord::Migration[7.1]
  def change
    create_table :exames do |t|
      t.references :consulta, null: false, foreign_key: true
      t.string :nome_exame
      t.string :status_exame
      t.text :resultado

      t.timestamps
    end
  end
end
