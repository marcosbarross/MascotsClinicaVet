class CreateFuncionarios < ActiveRecord::Migration[7.1]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :contato
      t.string :cargo
      t.string :login
      t.string :senha

      t.timestamps
    end
  end
end
