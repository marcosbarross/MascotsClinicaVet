# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_10_08_165106) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "nome"
    t.integer "idade"
    t.string "especie"
    t.string "raca"
    t.float "peso"
    t.bigint "tutor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_animals_on_tutor_id"
  end

  create_table "consulta", force: :cascade do |t|
    t.bigint "veterinario_id"
    t.bigint "animal_id", null: false
    t.date "data"
    t.time "hora"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_consulta_on_animal_id"
    t.index ["veterinario_id"], name: "index_consulta_on_veterinario_id"
  end

  create_table "estoque_internamentos", force: :cascade do |t|
    t.bigint "internamento_id", null: false
    t.string "medicamento"
    t.float "quantidade_disponivel"
    t.float "quantidade_utilizada"
    t.float "quantidade_minima"
    t.string "fornecedor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["internamento_id"], name: "index_estoque_internamentos_on_internamento_id"
  end

  create_table "estoque_vendas", force: :cascade do |t|
    t.string "medicamento"
    t.decimal "preco"
    t.integer "quantidade_disponivel"
    t.integer "quantidade_venda"
    t.string "fornecedor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exames", force: :cascade do |t|
    t.bigint "consulta_id", null: false
    t.string "nome_exame"
    t.string "status_exame"
    t.text "resultado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consulta_id"], name: "index_exames_on_consulta_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "contato"
    t.string "cargo"
    t.string "login"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "internamentos", force: :cascade do |t|
    t.bigint "consulta_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.string "medicamento"
    t.float "quantidade_medicamento"
    t.text "obs_monitoramento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consulta_id"], name: "index_internamentos_on_consulta_id"
  end

  create_table "prescricao_medicas", force: :cascade do |t|
    t.bigint "consulta_id", null: false
    t.date "data"
    t.string "medicamentos_prescritos"
    t.string "dosagens"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consulta_id"], name: "index_prescricao_medicas_on_consulta_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animals", "tutors"
  add_foreign_key "consulta", "animals"
  add_foreign_key "consulta", "funcionarios", column: "veterinario_id"
  add_foreign_key "estoque_internamentos", "internamentos"
  add_foreign_key "exames", "consulta", column: "consulta_id"
  add_foreign_key "internamentos", "consulta", column: "consulta_id"
  add_foreign_key "prescricao_medicas", "consulta", column: "consulta_id"
end
