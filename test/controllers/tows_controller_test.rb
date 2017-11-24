require 'test_helper'

class TowsControllerTest < ActionController::TestCase
  setup do
    @tow = tows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tow" do
    assert_difference('Tow.count') do
      post :create, tow: { lat: @tow.lat, lon: @tow.lon, name: @tow.name }
    end

    assert_redirected_to tow_path(assigns(:tow))
  end

  test "should show tow" do
    get :show, id: @tow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tow
    assert_response :success
  end

  test "should update tow" do
    patch :update, id: @tow, tow: { lat: @tow.lat, lon: @tow.lon, name: @tow.name }
    assert_redirected_to tow_path(assigns(:tow))
  end

  test "should destroy tow" do
    assert_difference('Tow.count', -1) do
      delete :destroy, id: @tow
    end

    assert_redirected_to tows_path
  end
end
