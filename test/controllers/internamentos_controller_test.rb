require "test_helper"

class InternamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internamento = internamentos(:one)
  end

  test "should get index" do
    get internamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_internamento_url
    assert_response :success
  end

  test "should create internamento" do
    assert_difference("Internamento.count") do
      post internamentos_url, params: { internamento: { consulta_id: @internamento.consulta_id, data_fim: @internamento.data_fim, data_inicio: @internamento.data_inicio, medicamento: @internamento.medicamento, obs_monitoramento: @internamento.obs_monitoramento, quantidade_medicamento: @internamento.quantidade_medicamento } }
    end

    assert_redirected_to internamento_url(Internamento.last)
  end

  test "should show internamento" do
    get internamento_url(@internamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_internamento_url(@internamento)
    assert_response :success
  end

  test "should update internamento" do
    patch internamento_url(@internamento), params: { internamento: { consulta_id: @internamento.consulta_id, data_fim: @internamento.data_fim, data_inicio: @internamento.data_inicio, medicamento: @internamento.medicamento, obs_monitoramento: @internamento.obs_monitoramento, quantidade_medicamento: @internamento.quantidade_medicamento } }
    assert_redirected_to internamento_url(@internamento)
  end

  test "should destroy internamento" do
    assert_difference("Internamento.count", -1) do
      delete internamento_url(@internamento)
    end

    assert_redirected_to internamentos_url
  end
end
