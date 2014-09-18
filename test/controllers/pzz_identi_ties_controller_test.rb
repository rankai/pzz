require 'test_helper'

class PzzIdentiTiesControllerTest < ActionController::TestCase
  setup do
    @pzz_identity = pzz_identities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_identities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_identity" do
    assert_difference('PzzIdentity.count') do
      post :create, pzz_identity: { identity_card_no: @pzz_identity.identity_card_no, identity_image: @pzz_identity.identity_image, identity_remark: @pzz_identity.identity_remark, identity_status: @pzz_identity.identity_status, pzz_user_id: @pzz_identity.pzz_user_id, user_gender: @pzz_identity.user_gender, user_realname: @pzz_identity.user_realname }
    end

    assert_redirected_to pzz_identity_path(assigns(:pzz_identity))
  end

  test "should show pzz_identity" do
    get :show, id: @pzz_identity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_identity
    assert_response :success
  end

  test "should update pzz_identity" do
    patch :update, id: @pzz_identity, pzz_identity: { identity_card_no: @pzz_identity.identity_card_no, identity_image: @pzz_identity.identity_image, identity_remark: @pzz_identity.identity_remark, identity_status: @pzz_identity.identity_status, pzz_user_id: @pzz_identity.pzz_user_id, user_gender: @pzz_identity.user_gender, user_realname: @pzz_identity.user_realname }
    assert_redirected_to pzz_identity_path(assigns(:pzz_identity))
  end

  test "should destroy pzz_identity" do
    assert_difference('PzzIdentity.count', -1) do
      delete :destroy, id: @pzz_identity
    end

    assert_redirected_to pzz_identities_path
  end
end
