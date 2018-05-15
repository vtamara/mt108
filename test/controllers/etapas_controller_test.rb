require 'test_helper'

class EtapasControllerTest < ActionController::TestCase
  setup do
    skip
    @etapa = Etapa(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:etapa)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create etapa" do
    skip
    assert_difference('Etapa.count') do
      post :create, etapa: { created_at: @etapa.created_at, fechacreacion: @etapa.fechacreacion, fechadeshabilitacion: @etapa.fechadeshabilitacion, nombre: @etapa.nombre, observaciones: @etapa.observaciones, updated_at: @etapa.updated_at }
    end

    assert_redirected_to etapa_path(assigns(:etapa))
  end

  test "should show etapa" do
    skip
    get :show, id: @etapa
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @etapa
    assert_response :success
  end

  test "should update etapa" do
    skip
    patch :update, id: @etapa, etapa: { created_at: @etapa.created_at, fechacreacion: @etapa.fechacreacion, fechadeshabilitacion: @etapa.fechadeshabilitacion, nombre: @etapa.nombre, observaciones: @etapa.observaciones, updated_at: @etapa.updated_at }
    assert_redirected_to etapa_path(assigns(:etapa))
  end

  test "should destroy etapa" do
    skip
    assert_difference('Etapa.count', -1) do
      delete :destroy, id: @etapa
    end

    assert_redirected_to etapaes_path
  end
end
