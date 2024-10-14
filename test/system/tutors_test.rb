require "application_system_test_case"

class TutorsTest < ApplicationSystemTestCase
  setup do
    @tutor = tutors(:one)
  end

  test "visiting the index" do
    visit tutors_url
    assert_selector "h1", text: "Tutors"
  end

  test "should create tutor" do
    visit tutors_url
    click_on "New tutor"

    fill_in "Email", with: @tutor.email
    fill_in "Endereco", with: @tutor.endereco
    fill_in "Nome", with: @tutor.nome
    fill_in "Telefone", with: @tutor.telefone
    click_on "Create Tutor"

    assert_text "Tutor was successfully created"
    click_on "Back"
  end

  test "should update Tutor" do
    visit tutor_url(@tutor)
    click_on "Edit this tutor", match: :first

    fill_in "Email", with: @tutor.email
    fill_in "Endereco", with: @tutor.endereco
    fill_in "Nome", with: @tutor.nome
    fill_in "Telefone", with: @tutor.telefone
    click_on "Update Tutor"

    assert_text "Tutor was successfully updated"
    click_on "Back"
  end

  test "should destroy Tutor" do
    visit tutor_url(@tutor)
    click_on "Destroy this tutor", match: :first

    assert_text "Tutor was successfully destroyed"
  end
end
