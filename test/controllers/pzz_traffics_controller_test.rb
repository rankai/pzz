require 'test_helper'

class PzzTrafficsControllerTest < ActionController::TestCase
  setup do
    @pzz_traffic = pzz_traffics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_traffics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_traffic" do
    assert_difference('PzzTraffic.count') do
      post :create, pzz_traffic: { traffic_description: @pzz_traffic.traffic_description, traffic_gps: @pzz_traffic.traffic_gps, traffic_image: @pzz_traffic.traffic_image, traffic_keywords: @pzz_traffic.traffic_keywords, user_id: @pzz_traffic.user_id }
    end

    assert_redirected_to pzz_traffic_path(assigns(:pzz_traffic))
  end

  test "should show pzz_traffic" do
    get :show, id: @pzz_traffic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_traffic
    assert_response :success
  end

  test "should update pzz_traffic" do
    patch :update, id: @pzz_traffic, pzz_traffic: { traffic_description: @pzz_traffic.traffic_description, traffic_gps: @pzz_traffic.traffic_gps, traffic_image: @pzz_traffic.traffic_image, traffic_keywords: @pzz_traffic.traffic_keywords, user_id: @pzz_traffic.user_id }
    assert_redirected_to pzz_traffic_path(assigns(:pzz_traffic))
  end

  test "should destroy pzz_traffic" do
    assert_difference('PzzTraffic.count', -1) do
      delete :destroy, id: @pzz_traffic
    end

    assert_redirected_to pzz_traffics_path
  end
end
