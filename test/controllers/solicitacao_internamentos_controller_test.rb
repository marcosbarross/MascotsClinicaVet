require "test_helper"

class SolicitacaoInternamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solicitacao_internamento = solicitacao_internamentos(:one)
  end

  test "should get index" do
    get solicitacao_internamentos_url, as: :json
    assert_response :success
  end

  test "should create solicitacao_internamento" do
    assert_difference("SolicitacaoInternamento.count") do
      post solicitacao_internamentos_url, params: { solicitacao_internamento: { consulta_id: @solicitacao_internamento.consulta_id, data_solicitacao: @solicitacao_internamento.data_solicitacao, observacao: @solicitacao_internamento.observacao } }, as: :json
    end

    assert_response :created
  end

  test "should show solicitacao_internamento" do
    get solicitacao_internamento_url(@solicitacao_internamento), as: :json
    assert_response :success
  end

  test "should update solicitacao_internamento" do
    patch solicitacao_internamento_url(@solicitacao_internamento), params: { solicitacao_internamento: { consulta_id: @solicitacao_internamento.consulta_id, data_solicitacao: @solicitacao_internamento.data_solicitacao, observacao: @solicitacao_internamento.observacao } }, as: :json
    assert_response :success
  end

  test "should destroy solicitacao_internamento" do
    assert_difference("SolicitacaoInternamento.count", -1) do
      delete solicitacao_internamento_url(@solicitacao_internamento), as: :json
    end

    assert_response :no_content
  end
end
