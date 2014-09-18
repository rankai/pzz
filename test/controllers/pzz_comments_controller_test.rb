require 'test_helper'

class PzzCommentsControllerTest < ActionController::TestCase
  setup do
    @pzz_comment = pzz_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_comment" do
    assert_difference('PzzComment.count') do
      post :create, pzz_comment: { comment_approved: @pzz_comment.comment_approved, comment_content: @pzz_comment.comment_content, comment_parent_id: @pzz_comment.comment_parent_id, pzz_post_id: @pzz_comment.pzz_post_id, pzz_user_id: @pzz_comment.pzz_user_id, user_agent: @pzz_comment.user_agent, user_email: @pzz_comment.user_email, user_ip: @pzz_comment.user_ip, user_url: @pzz_comment.user_url }
    end

    assert_redirected_to pzz_comment_path(assigns(:pzz_comment))
  end

  test "should show pzz_comment" do
    get :show, id: @pzz_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_comment
    assert_response :success
  end

  test "should update pzz_comment" do
    patch :update, id: @pzz_comment, pzz_comment: { comment_approved: @pzz_comment.comment_approved, comment_content: @pzz_comment.comment_content, comment_parent_id: @pzz_comment.comment_parent_id, pzz_post_id: @pzz_comment.pzz_post_id, pzz_user_id: @pzz_comment.pzz_user_id, user_agent: @pzz_comment.user_agent, user_email: @pzz_comment.user_email, user_ip: @pzz_comment.user_ip, user_url: @pzz_comment.user_url }
    assert_redirected_to pzz_comment_path(assigns(:pzz_comment))
  end

  test "should destroy pzz_comment" do
    assert_difference('PzzComment.count', -1) do
      delete :destroy, id: @pzz_comment
    end

    assert_redirected_to pzz_comments_path
  end
end
