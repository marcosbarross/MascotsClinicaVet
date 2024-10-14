class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :nome
      t.integer :idade
      t.string :especie
      t.string :raca
      t.float :peso
      t.references :tutor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
