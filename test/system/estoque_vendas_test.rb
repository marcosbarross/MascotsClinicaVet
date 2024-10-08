require "application_system_test_case"

class EstoqueVendasTest < ApplicationSystemTestCase
  setup do
    @estoque_venda = estoque_vendas(:one)
  end

  test "visiting the index" do
    visit estoque_vendas_url
    assert_selector "h1", text: "Estoque vendas"
  end

  test "should create estoque venda" do
    visit estoque_vendas_url
    click_on "New estoque venda"

    fill_in "Fornecedor", with: @estoque_venda.fornecedor
    fill_in "Medicamento", with: @estoque_venda.medicamento
    fill_in "Preco", with: @estoque_venda.preco
    fill_in "Quantidade disponivel", with: @estoque_venda.quantidade_disponivel
    fill_in "Quantidade venda", with: @estoque_venda.quantidade_venda
    click_on "Create Estoque venda"

    assert_text "Estoque venda was successfully created"
    click_on "Back"
  end

  test "should update Estoque venda" do
    visit estoque_venda_url(@estoque_venda)
    click_on "Edit this estoque venda", match: :first

    fill_in "Fornecedor", with: @estoque_venda.fornecedor
    fill_in "Medicamento", with: @estoque_venda.medicamento
    fill_in "Preco", with: @estoque_venda.preco
    fill_in "Quantidade disponivel", with: @estoque_venda.quantidade_disponivel
    fill_in "Quantidade venda", with: @estoque_venda.quantidade_venda
    click_on "Update Estoque venda"

    assert_text "Estoque venda was successfully updated"
    click_on "Back"
  end

  test "should destroy Estoque venda" do
    visit estoque_venda_url(@estoque_venda)
    click_on "Destroy this estoque venda", match: :first

    assert_text "Estoque venda was successfully destroyed"
  end
end
