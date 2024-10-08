require "test_helper"

class EstoqueInternamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estoque_internamento = estoque_internamentos(:one)
  end

  test "should get index" do
    get estoque_internamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_estoque_internamento_url
    assert_response :success
  end

  test "should create estoque_internamento" do
    assert_difference("EstoqueInternamento.count") do
      post estoque_internamentos_url, params: { estoque_internamento: { fornecedor: @estoque_internamento.fornecedor, medicamento: @estoque_internamento.medicamento, quantidade_disponivel: @estoque_internamento.quantidade_disponivel, quantidade_minima: @estoque_internamento.quantidade_minima, quantidade_utilizada: @estoque_internamento.quantidade_utilizada, solicitacao_internamento_id: @estoque_internamento.solicitacao_internamento_id } }
    end

    assert_redirected_to estoque_internamento_url(EstoqueInternamento.last)
  end

  test "should show estoque_internamento" do
    get estoque_internamento_url(@estoque_internamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_estoque_internamento_url(@estoque_internamento)
    assert_response :success
  end

  test "should update estoque_internamento" do
    patch estoque_internamento_url(@estoque_internamento), params: { estoque_internamento: { fornecedor: @estoque_internamento.fornecedor, medicamento: @estoque_internamento.medicamento, quantidade_disponivel: @estoque_internamento.quantidade_disponivel, quantidade_minima: @estoque_internamento.quantidade_minima, quantidade_utilizada: @estoque_internamento.quantidade_utilizada, solicitacao_internamento_id: @estoque_internamento.solicitacao_internamento_id } }
    assert_redirected_to estoque_internamento_url(@estoque_internamento)
  end

  test "should destroy estoque_internamento" do
    assert_difference("EstoqueInternamento.count", -1) do
      delete estoque_internamento_url(@estoque_internamento)
    end

    assert_redirected_to estoque_internamentos_url
  end
end
