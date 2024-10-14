require "application_system_test_case"

class PrescricaoMedicasTest < ApplicationSystemTestCase
  setup do
    @prescricao_medica = prescricao_medicas(:one)
  end

  test "visiting the index" do
    visit prescricao_medicas_url
    assert_selector "h1", text: "Prescricao medicas"
  end

  test "should create prescricao medica" do
    visit prescricao_medicas_url
    click_on "New prescricao medica"

    fill_in "Consulta", with: @prescricao_medica.consulta_id
    fill_in "Data", with: @prescricao_medica.data
    fill_in "Dosagens", with: @prescricao_medica.dosagens
    fill_in "Medicamentos prescritos", with: @prescricao_medica.medicamentos_prescritos
    fill_in "Observacao", with: @prescricao_medica.observacao
    click_on "Create Prescricao medica"

    assert_text "Prescricao medica was successfully created"
    click_on "Back"
  end

  test "should update Prescricao medica" do
    visit prescricao_medica_url(@prescricao_medica)
    click_on "Edit this prescricao medica", match: :first

    fill_in "Consulta", with: @prescricao_medica.consulta_id
    fill_in "Data", with: @prescricao_medica.data
    fill_in "Dosagens", with: @prescricao_medica.dosagens
    fill_in "Medicamentos prescritos", with: @prescricao_medica.medicamentos_prescritos
    fill_in "Observacao", with: @prescricao_medica.observacao
    click_on "Update Prescricao medica"

    assert_text "Prescricao medica was successfully updated"
    click_on "Back"
  end

  test "should destroy Prescricao medica" do
    visit prescricao_medica_url(@prescricao_medica)
    click_on "Destroy this prescricao medica", match: :first

    assert_text "Prescricao medica was successfully destroyed"
  end
end
