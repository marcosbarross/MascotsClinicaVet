require "test_helper"

class EstoqueVendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estoque_venda = estoque_vendas(:one)
  end

  test "should get index" do
    get estoque_vendas_url
    assert_response :success
  end

  test "should get new" do
    get new_estoque_venda_url
    assert_response :success
  end

  test "should create estoque_venda" do
    assert_difference("EstoqueVenda.count") do
      post estoque_vendas_url, params: { estoque_venda: { fornecedor: @estoque_venda.fornecedor, medicamento: @estoque_venda.medicamento, preco: @estoque_venda.preco, quantidade_disponivel: @estoque_venda.quantidade_disponivel, quantidade_venda: @estoque_venda.quantidade_venda } }
    end

    assert_redirected_to estoque_venda_url(EstoqueVenda.last)
  end

  test "should show estoque_venda" do
    get estoque_venda_url(@estoque_venda)
    assert_response :success
  end

  test "should get edit" do
    get edit_estoque_venda_url(@estoque_venda)
    assert_response :success
  end

  test "should update estoque_venda" do
    patch estoque_venda_url(@estoque_venda), params: { estoque_venda: { fornecedor: @estoque_venda.fornecedor, medicamento: @estoque_venda.medicamento, preco: @estoque_venda.preco, quantidade_disponivel: @estoque_venda.quantidade_disponivel, quantidade_venda: @estoque_venda.quantidade_venda } }
    assert_redirected_to estoque_venda_url(@estoque_venda)
  end

  test "should destroy estoque_venda" do
    assert_difference("EstoqueVenda.count", -1) do
      delete estoque_venda_url(@estoque_venda)
    end

    assert_redirected_to estoque_vendas_url
  end
end
