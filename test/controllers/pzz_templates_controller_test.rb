require 'test_helper'

class PzzTemplatesControllerTest < ActionController::TestCase
  setup do
    @pzz_template = pzz_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_template" do
    assert_difference('PzzTemplate.count') do
      post :create, pzz_template: { template_key: @pzz_template.template_key, template_type: @pzz_template.template_type, template_value: @pzz_template.template_value }
    end

    assert_redirected_to pzz_template_path(assigns(:pzz_template))
  end

  test "should show pzz_template" do
    get :show, id: @pzz_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_template
    assert_response :success
  end

  test "should update pzz_template" do
    patch :update, id: @pzz_template, pzz_template: { template_key: @pzz_template.template_key, template_type: @pzz_template.template_type, template_value: @pzz_template.template_value }
    assert_redirected_to pzz_template_path(assigns(:pzz_template))
  end

  test "should destroy pzz_template" do
    assert_difference('PzzTemplate.count', -1) do
      delete :destroy, id: @pzz_template
    end

    assert_redirected_to pzz_templates_path
  end
end
