require "application_system_test_case"

class EstoqueInternamentosTest < ApplicationSystemTestCase
  setup do
    @estoque_internamento = estoque_internamentos(:one)
  end

  test "visiting the index" do
    visit estoque_internamentos_url
    assert_selector "h1", text: "Estoque internamentos"
  end

  test "should create estoque internamento" do
    visit estoque_internamentos_url
    click_on "New estoque internamento"

    fill_in "Fornecedor", with: @estoque_internamento.fornecedor
    fill_in "Medicamento", with: @estoque_internamento.medicamento
    fill_in "Quantidade disponivel", with: @estoque_internamento.quantidade_disponivel
    fill_in "Quantidade minima", with: @estoque_internamento.quantidade_minima
    fill_in "Quantidade utilizada", with: @estoque_internamento.quantidade_utilizada
    fill_in "Solicitacao internamento", with: @estoque_internamento.solicitacao_internamento_id
    click_on "Create Estoque internamento"

    assert_text "Estoque internamento was successfully created"
    click_on "Back"
  end

  test "should update Estoque internamento" do
    visit estoque_internamento_url(@estoque_internamento)
    click_on "Edit this estoque internamento", match: :first

    fill_in "Fornecedor", with: @estoque_internamento.fornecedor
    fill_in "Medicamento", with: @estoque_internamento.medicamento
    fill_in "Quantidade disponivel", with: @estoque_internamento.quantidade_disponivel
    fill_in "Quantidade minima", with: @estoque_internamento.quantidade_minima
    fill_in "Quantidade utilizada", with: @estoque_internamento.quantidade_utilizada
    fill_in "Solicitacao internamento", with: @estoque_internamento.solicitacao_internamento_id
    click_on "Update Estoque internamento"

    assert_text "Estoque internamento was successfully updated"
    click_on "Back"
  end

  test "should destroy Estoque internamento" do
    visit estoque_internamento_url(@estoque_internamento)
    click_on "Destroy this estoque internamento", match: :first

    assert_text "Estoque internamento was successfully destroyed"
  end
end
