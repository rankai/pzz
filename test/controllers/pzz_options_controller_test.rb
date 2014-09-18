require 'test_helper'

class PzzOptionsControllerTest < ActionController::TestCase
  setup do
    @pzz_option = pzz_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_option" do
    assert_difference('PzzOption.count') do
      post :create, pzz_option: { autoload: @pzz_option.autoload, option_name: @pzz_option.option_name, option_value: @pzz_option.option_value }
    end

    assert_redirected_to pzz_option_path(assigns(:pzz_option))
  end

  test "should show pzz_option" do
    get :show, id: @pzz_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_option
    assert_response :success
  end

  test "should update pzz_option" do
    patch :update, id: @pzz_option, pzz_option: { autoload: @pzz_option.autoload, option_name: @pzz_option.option_name, option_value: @pzz_option.option_value }
    assert_redirected_to pzz_option_path(assigns(:pzz_option))
  end

  test "should destroy pzz_option" do
    assert_difference('PzzOption.count', -1) do
      delete :destroy, id: @pzz_option
    end

    assert_redirected_to pzz_options_path
  end
end
