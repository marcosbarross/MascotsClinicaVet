require "application_system_test_case"

class FuncionariosTest < ApplicationSystemTestCase
  setup do
    @funcionario = funcionarios(:one)
  end

  test "visiting the index" do
    visit funcionarios_url
    assert_selector "h1", text: "Funcionarios"
  end

  test "should create funcionario" do
    visit funcionarios_url
    click_on "New funcionario"

    fill_in "Cargo", with: @funcionario.cargo
    fill_in "Contato", with: @funcionario.contato
    fill_in "Login", with: @funcionario.login
    fill_in "Nome", with: @funcionario.nome
    fill_in "Senha", with: @funcionario.senha
    click_on "Create Funcionario"

    assert_text "Funcionario was successfully created"
    click_on "Back"
  end

  test "should update Funcionario" do
    visit funcionario_url(@funcionario)
    click_on "Edit this funcionario", match: :first

    fill_in "Cargo", with: @funcionario.cargo
    fill_in "Contato", with: @funcionario.contato
    fill_in "Login", with: @funcionario.login
    fill_in "Nome", with: @funcionario.nome
    fill_in "Senha", with: @funcionario.senha
    click_on "Update Funcionario"

    assert_text "Funcionario was successfully updated"
    click_on "Back"
  end

  test "should destroy Funcionario" do
    visit funcionario_url(@funcionario)
    click_on "Destroy this funcionario", match: :first

    assert_text "Funcionario was successfully destroyed"
  end
end
