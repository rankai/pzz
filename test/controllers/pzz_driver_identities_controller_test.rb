require 'test_helper'

class PzzDriverIdentitiesControllerTest < ActionController::TestCase
  setup do
    @pzz_driver_identity = pzz_driver_identities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_driver_identities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_driver_identity" do
    assert_difference('PzzDriverIdentity.count') do
      post :create, pzz_driver_identity: { identity_dl_image: @pzz_driver_identity.identity_dl_image, identity_dl_issued: @pzz_driver_identity.identity_dl_issued, identity_dl_no: @pzz_driver_identity.identity_dl_no, identity_dl_status: @pzz_driver_identity.identity_dl_status, identity_dl_type: @pzz_driver_identity.identity_dl_type, identity_status: @pzz_driver_identity.identity_status, indentity_remark: @pzz_driver_identity.indentity_remark, pzz_user_id: @pzz_driver_identity.pzz_user_id, user_realname: @pzz_driver_identity.user_realname }
    end

    assert_redirected_to pzz_driver_identity_path(assigns(:pzz_driver_identity))
  end

  test "should show pzz_driver_identity" do
    get :show, id: @pzz_driver_identity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_driver_identity
    assert_response :success
  end

  test "should update pzz_driver_identity" do
    patch :update, id: @pzz_driver_identity, pzz_driver_identity: { identity_dl_image: @pzz_driver_identity.identity_dl_image, identity_dl_issued: @pzz_driver_identity.identity_dl_issued, identity_dl_no: @pzz_driver_identity.identity_dl_no, identity_dl_status: @pzz_driver_identity.identity_dl_status, identity_dl_type: @pzz_driver_identity.identity_dl_type, identity_status: @pzz_driver_identity.identity_status, indentity_remark: @pzz_driver_identity.indentity_remark, pzz_user_id: @pzz_driver_identity.pzz_user_id, user_realname: @pzz_driver_identity.user_realname }
    assert_redirected_to pzz_driver_identity_path(assigns(:pzz_driver_identity))
  end

  test "should destroy pzz_driver_identity" do
    assert_difference('PzzDriverIdentity.count', -1) do
      delete :destroy, id: @pzz_driver_identity
    end

    assert_redirected_to pzz_driver_identities_path
  end
end
