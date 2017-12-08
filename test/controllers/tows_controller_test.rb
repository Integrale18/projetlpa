require 'test_helper'

class TowsControllerTest < ActionController::TestCase
  setup do
    @tow = tows(:one)
    @inexisting = tows(:inexisting)
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
    VCR.use_cassette("town_ok") do
    assert_difference('Tow.count') do
      post :create, tow: { lat: @tow.lat, lon: @tow.lon, name: @tow.name }
    end
 end
    assert_redirected_to tow_path(assigns(:tow))
  end
test "should fail if tow does not exist" do
    VCR.use_cassette("tow_inexisting") do
      assert_no_difference('Tow.count') do
        post :create, tow: { name: @inexisting.name }
      end
end
    assert_response :success
  end
  test "should show tow" do
        VCR.use_cassette("tow_show") do
    get :show, id: @tow
    assert_response :success
  end
 end
  test "should get edit" do
    get :edit, id: @tow
    assert_response :success
  end

  test "should update tow" do
        VCR.use_cassette("tow_update") do
    patch :update, id: @tow, tow: { lat: @tow.lat, lon: @tow.lon, name: @tow.name }
    assert_redirected_to tow_path(assigns(:tow))
  end
 end
  test "should destroy tow" do
    assert_difference('Tow.count', -1) do
      delete :destroy, id: @tow
    end

    assert_redirected_to tows_path
  end
end
