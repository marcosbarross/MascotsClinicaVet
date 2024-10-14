require "application_system_test_case"

class ExamesTest < ApplicationSystemTestCase
  setup do
    @exame = exames(:one)
  end

  test "visiting the index" do
    visit exames_url
    assert_selector "h1", text: "Exames"
  end

  test "should create exame" do
    visit exames_url
    click_on "New exame"

    fill_in "Consulta", with: @exame.consulta_id
    fill_in "Nome exame", with: @exame.nome_exame
    fill_in "Resultado", with: @exame.resultado
    fill_in "Status exame", with: @exame.status_exame
    click_on "Create Exame"

    assert_text "Exame was successfully created"
    click_on "Back"
  end

  test "should update Exame" do
    visit exame_url(@exame)
    click_on "Edit this exame", match: :first

    fill_in "Consulta", with: @exame.consulta_id
    fill_in "Nome exame", with: @exame.nome_exame
    fill_in "Resultado", with: @exame.resultado
    fill_in "Status exame", with: @exame.status_exame
    click_on "Update Exame"

    assert_text "Exame was successfully updated"
    click_on "Back"
  end

  test "should destroy Exame" do
    visit exame_url(@exame)
    click_on "Destroy this exame", match: :first

    assert_text "Exame was successfully destroyed"
  end
end
