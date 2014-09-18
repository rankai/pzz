require 'test_helper'

class PzzMessagesControllerTest < ActionController::TestCase
  setup do
    @pzz_message = pzz_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_message" do
    assert_difference('PzzMessage.count') do
      post :create, pzz_message: { from_user_id: @pzz_message.from_user_id, from_user_nickname: @pzz_message.from_user_nickname, message_content: @pzz_message.message_content, message_folder: @pzz_message.message_folder, message_related_id: @pzz_message.message_related_id, message_status: @pzz_message.message_status, message_subject: @pzz_message.message_subject, message_type: @pzz_message.message_type, to_user_id: @pzz_message.to_user_id }
    end

    assert_redirected_to pzz_message_path(assigns(:pzz_message))
  end

  test "should show pzz_message" do
    get :show, id: @pzz_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_message
    assert_response :success
  end

  test "should update pzz_message" do
    patch :update, id: @pzz_message, pzz_message: { from_user_id: @pzz_message.from_user_id, from_user_nickname: @pzz_message.from_user_nickname, message_content: @pzz_message.message_content, message_folder: @pzz_message.message_folder, message_related_id: @pzz_message.message_related_id, message_status: @pzz_message.message_status, message_subject: @pzz_message.message_subject, message_type: @pzz_message.message_type, to_user_id: @pzz_message.to_user_id }
    assert_redirected_to pzz_message_path(assigns(:pzz_message))
  end

  test "should destroy pzz_message" do
    assert_difference('PzzMessage.count', -1) do
      delete :destroy, id: @pzz_message
    end

    assert_redirected_to pzz_messages_path
  end
end
