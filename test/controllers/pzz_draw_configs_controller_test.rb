require 'test_helper'

class PzzDrawConfigsControllerTest < ActionController::TestCase
  setup do
    @pzz_draw_config = pzz_draw_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_draw_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_draw_config" do
    assert_difference('PzzDrawConfig.count') do
      post :create, pzz_draw_config: { draw_count: @pzz_draw_config.draw_count, draw_description: @pzz_draw_config.draw_description, draw_endtime: @pzz_draw_config.draw_endtime, draw_starttime: @pzz_draw_config.draw_starttime, draw_status: @pzz_draw_config.draw_status, draw_title: @pzz_draw_config.draw_title, draw_type: @pzz_draw_config.draw_type, user_filter: @pzz_draw_config.user_filter }
    end

    assert_redirected_to pzz_draw_config_path(assigns(:pzz_draw_config))
  end

  test "should show pzz_draw_config" do
    get :show, id: @pzz_draw_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_draw_config
    assert_response :success
  end

  test "should update pzz_draw_config" do
    patch :update, id: @pzz_draw_config, pzz_draw_config: { draw_count: @pzz_draw_config.draw_count, draw_description: @pzz_draw_config.draw_description, draw_endtime: @pzz_draw_config.draw_endtime, draw_starttime: @pzz_draw_config.draw_starttime, draw_status: @pzz_draw_config.draw_status, draw_title: @pzz_draw_config.draw_title, draw_type: @pzz_draw_config.draw_type, user_filter: @pzz_draw_config.user_filter }
    assert_redirected_to pzz_draw_config_path(assigns(:pzz_draw_config))
  end

  test "should destroy pzz_draw_config" do
    assert_difference('PzzDrawConfig.count', -1) do
      delete :destroy, id: @pzz_draw_config
    end

    assert_redirected_to pzz_draw_configs_path
  end
end
