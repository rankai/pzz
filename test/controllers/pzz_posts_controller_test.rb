require 'test_helper'

class PzzPostsControllerTest < ActionController::TestCase
  setup do
    @pzz_post = pzz_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_post" do
    assert_difference('PzzPost.count') do
      post :create, pzz_post: { comment_count: @pzz_post.comment_count, comment_status: @pzz_post.comment_status, ping_status: @pzz_post.ping_status, pinged: @pzz_post.pinged, post_content: @pzz_post.post_content, post_content_filtered: @pzz_post.post_content_filtered, post_excerpt: @pzz_post.post_excerpt, post_guid: @pzz_post.post_guid, post_name: @pzz_post.post_name, post_order: @pzz_post.post_order, post_status: @pzz_post.post_status, post_title: @pzz_post.post_title, pzz_user_id: @pzz_post.pzz_user_id, to_ping: @pzz_post.to_ping }
    end

    assert_redirected_to pzz_post_path(assigns(:pzz_post))
  end

  test "should show pzz_post" do
    get :show, id: @pzz_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_post
    assert_response :success
  end

  test "should update pzz_post" do
    patch :update, id: @pzz_post, pzz_post: { comment_count: @pzz_post.comment_count, comment_status: @pzz_post.comment_status, ping_status: @pzz_post.ping_status, pinged: @pzz_post.pinged, post_content: @pzz_post.post_content, post_content_filtered: @pzz_post.post_content_filtered, post_excerpt: @pzz_post.post_excerpt, post_guid: @pzz_post.post_guid, post_name: @pzz_post.post_name, post_order: @pzz_post.post_order, post_status: @pzz_post.post_status, post_title: @pzz_post.post_title, pzz_user_id: @pzz_post.pzz_user_id, to_ping: @pzz_post.to_ping }
    assert_redirected_to pzz_post_path(assigns(:pzz_post))
  end

  test "should destroy pzz_post" do
    assert_difference('PzzPost.count', -1) do
      delete :destroy, id: @pzz_post
    end

    assert_redirected_to pzz_posts_path
  end
end
