require "application_system_test_case"

class ConsultaTest < ApplicationSystemTestCase
  setup do
    @consultum = consulta(:one)
  end

  test "visiting the index" do
    visit consulta_url
    assert_selector "h1", text: "Consulta"
  end

  test "should create consultum" do
    visit consulta_url
    click_on "New consultum"

    fill_in "Animal", with: @consultum.animal_id
    fill_in "Data", with: @consultum.data
    fill_in "Hora", with: @consultum.hora
    fill_in "Observacao", with: @consultum.observacao
    fill_in "Veterinario", with: @consultum.veterinario
    click_on "Create Consultum"

    assert_text "Consultum was successfully created"
    click_on "Back"
  end

  test "should update Consultum" do
    visit consultum_url(@consultum)
    click_on "Edit this consultum", match: :first

    fill_in "Animal", with: @consultum.animal_id
    fill_in "Data", with: @consultum.data
    fill_in "Hora", with: @consultum.hora
    fill_in "Observacao", with: @consultum.observacao
    fill_in "Veterinario", with: @consultum.veterinario
    click_on "Update Consultum"

    assert_text "Consultum was successfully updated"
    click_on "Back"
  end

  test "should destroy Consultum" do
    visit consultum_url(@consultum)
    click_on "Destroy this consultum", match: :first

    assert_text "Consultum was successfully destroyed"
  end
end
