class CreateTutors < ActiveRecord::Migration[7.1]
  def change
    create_table :tutors do |t|
      t.string :nome
      t.string :endereco
      t.string :telefone
      t.string :email

      t.timestamps
    end
  end
end
