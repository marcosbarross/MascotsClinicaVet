require "test_helper"

class ConsultaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consultum = consulta(:one)
  end

  test "should get index" do
    get consulta_url
    assert_response :success
  end

  test "should get new" do
    get new_consultum_url
    assert_response :success
  end

  test "should create consultum" do
    assert_difference("Consultum.count") do
      post consulta_url, params: { consultum: { animal_id: @consultum.animal_id, data: @consultum.data, hora: @consultum.hora, observacao: @consultum.observacao, veterinario: @consultum.veterinario } }
    end

    assert_redirected_to consultum_url(Consultum.last)
  end

  test "should show consultum" do
    get consultum_url(@consultum)
    assert_response :success
  end

  test "should get edit" do
    get edit_consultum_url(@consultum)
    assert_response :success
  end

  test "should update consultum" do
    patch consultum_url(@consultum), params: { consultum: { animal_id: @consultum.animal_id, data: @consultum.data, hora: @consultum.hora, observacao: @consultum.observacao, veterinario: @consultum.veterinario } }
    assert_redirected_to consultum_url(@consultum)
  end

  test "should destroy consultum" do
    assert_difference("Consultum.count", -1) do
      delete consultum_url(@consultum)
    end

    assert_redirected_to consulta_url
  end
end
