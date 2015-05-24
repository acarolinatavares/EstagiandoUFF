require 'test_helper'

class AvaliacoesControllerTest < ActionController::TestCase
  setup do
    @avaliacao = avaliacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:avaliacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create avaliacao" do
    assert_difference('Avaliacao.count') do
      post :create, avaliacao: { empresa_id: @avaliacao.empresa_id, id: @avaliacao.id, situacao_avaliacao_id: @avaliacao.situacao_avaliacao_id, usuario_id: @avaliacao.usuario_id }
    end

    assert_redirected_to avaliacao_path(assigns(:avaliacao))
  end

  test "should show avaliacao" do
    get :show, id: @avaliacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @avaliacao
    assert_response :success
  end

  test "should update avaliacao" do
    put :update, id: @avaliacao, avaliacao: { empresa_id: @avaliacao.empresa_id, id: @avaliacao.id, situacao_avaliacao_id: @avaliacao.situacao_avaliacao_id, usuario_id: @avaliacao.usuario_id }
    assert_redirected_to avaliacao_path(assigns(:avaliacao))
  end

  test "should destroy avaliacao" do
    assert_difference('Avaliacao.count', -1) do
      delete :destroy, id: @avaliacao
    end

    assert_redirected_to avaliacoes_path
  end
end
