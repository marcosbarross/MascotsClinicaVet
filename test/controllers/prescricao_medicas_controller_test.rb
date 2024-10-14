require "test_helper"

class PrescricaoMedicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prescricao_medica = prescricao_medicas(:one)
  end

  test "should get index" do
    get prescricao_medicas_url
    assert_response :success
  end

  test "should get new" do
    get new_prescricao_medica_url
    assert_response :success
  end

  test "should create prescricao_medica" do
    assert_difference("PrescricaoMedica.count") do
      post prescricao_medicas_url, params: { prescricao_medica: { consulta_id: @prescricao_medica.consulta_id, data: @prescricao_medica.data, dosagens: @prescricao_medica.dosagens, medicamentos_prescritos: @prescricao_medica.medicamentos_prescritos, observacao: @prescricao_medica.observacao } }
    end

    assert_redirected_to prescricao_medica_url(PrescricaoMedica.last)
  end

  test "should show prescricao_medica" do
    get prescricao_medica_url(@prescricao_medica)
    assert_response :success
  end

  test "should get edit" do
    get edit_prescricao_medica_url(@prescricao_medica)
    assert_response :success
  end

  test "should update prescricao_medica" do
    patch prescricao_medica_url(@prescricao_medica), params: { prescricao_medica: { consulta_id: @prescricao_medica.consulta_id, data: @prescricao_medica.data, dosagens: @prescricao_medica.dosagens, medicamentos_prescritos: @prescricao_medica.medicamentos_prescritos, observacao: @prescricao_medica.observacao } }
    assert_redirected_to prescricao_medica_url(@prescricao_medica)
  end

  test "should destroy prescricao_medica" do
    assert_difference("PrescricaoMedica.count", -1) do
      delete prescricao_medica_url(@prescricao_medica)
    end

    assert_redirected_to prescricao_medicas_url
  end
end
