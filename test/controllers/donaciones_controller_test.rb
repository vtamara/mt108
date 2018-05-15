require 'test_helper'

class DonacionesControllerTest < ActionController::TestCase
  setup do
    skip
    @donacion = Donacion(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:donacion)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create donacion" do
    skip
    assert_difference('Donacion.count') do
      post :create, donacion: { created_at: @donacion.created_at, fechacreacion: @donacion.fechacreacion, fechadeshabilitacion: @donacion.fechadeshabilitacion, nombre: @donacion.nombre, observaciones: @donacion.observaciones, updated_at: @donacion.updated_at }
    end

    assert_redirected_to donacion_path(assigns(:donacion))
  end

  test "should show donacion" do
    skip
    get :show, id: @donacion
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @donacion
    assert_response :success
  end

  test "should update donacion" do
    skip
    patch :update, id: @donacion, donacion: { created_at: @donacion.created_at, fechacreacion: @donacion.fechacreacion, fechadeshabilitacion: @donacion.fechadeshabilitacion, nombre: @donacion.nombre, observaciones: @donacion.observaciones, updated_at: @donacion.updated_at }
    assert_redirected_to donacion_path(assigns(:donacion))
  end

  test "should destroy donacion" do
    skip
    assert_difference('Donacion.count', -1) do
      delete :destroy, id: @donacion
    end

    assert_redirected_to donaciones_path
  end
end
