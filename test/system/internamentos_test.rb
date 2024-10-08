require "application_system_test_case"

class InternamentosTest < ApplicationSystemTestCase
  setup do
    @internamento = internamentos(:one)
  end

  test "visiting the index" do
    visit internamentos_url
    assert_selector "h1", text: "Internamentos"
  end

  test "should create internamento" do
    visit internamentos_url
    click_on "New internamento"

    fill_in "Consulta", with: @internamento.consulta_id
    fill_in "Data fim", with: @internamento.data_fim
    fill_in "Data inicio", with: @internamento.data_inicio
    fill_in "Medicamento", with: @internamento.medicamento
    fill_in "Obs monitoramento", with: @internamento.obs_monitoramento
    fill_in "Quantidade medicamento", with: @internamento.quantidade_medicamento
    click_on "Create Internamento"

    assert_text "Internamento was successfully created"
    click_on "Back"
  end

  test "should update Internamento" do
    visit internamento_url(@internamento)
    click_on "Edit this internamento", match: :first

    fill_in "Consulta", with: @internamento.consulta_id
    fill_in "Data fim", with: @internamento.data_fim
    fill_in "Data inicio", with: @internamento.data_inicio
    fill_in "Medicamento", with: @internamento.medicamento
    fill_in "Obs monitoramento", with: @internamento.obs_monitoramento
    fill_in "Quantidade medicamento", with: @internamento.quantidade_medicamento
    click_on "Update Internamento"

    assert_text "Internamento was successfully updated"
    click_on "Back"
  end

  test "should destroy Internamento" do
    visit internamento_url(@internamento)
    click_on "Destroy this internamento", match: :first

    assert_text "Internamento was successfully destroyed"
  end
end
