require 'test_helper'

class SituacaoAvaliacoesControllerTest < ActionController::TestCase
  setup do
    @situacao_avaliacao = situacao_avaliacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:situacao_avaliacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create situacao_avaliacao" do
    assert_difference('SituacaoAvaliacao.count') do
      post :create, situacao_avaliacao: { descricao: @situacao_avaliacao.descricao, id: @situacao_avaliacao.id }
    end

    assert_redirected_to situacao_avaliacao_path(assigns(:situacao_avaliacao))
  end

  test "should show situacao_avaliacao" do
    get :show, id: @situacao_avaliacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @situacao_avaliacao
    assert_response :success
  end

  test "should update situacao_avaliacao" do
    put :update, id: @situacao_avaliacao, situacao_avaliacao: { descricao: @situacao_avaliacao.descricao, id: @situacao_avaliacao.id }
    assert_redirected_to situacao_avaliacao_path(assigns(:situacao_avaliacao))
  end

  test "should destroy situacao_avaliacao" do
    assert_difference('SituacaoAvaliacao.count', -1) do
      delete :destroy, id: @situacao_avaliacao
    end

    assert_redirected_to situacao_avaliacoes_path
  end
end
