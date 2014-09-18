require 'test_helper'

class PzzLinksControllerTest < ActionController::TestCase
  setup do
    @pzz_link = pzz_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_link" do
    assert_difference('PzzLink.count') do
      post :create, pzz_link: { link_description: @pzz_link.link_description, link_image: @pzz_link.link_image, link_name: @pzz_link.link_name, link_notes: @pzz_link.link_notes, link_rating: @pzz_link.link_rating, link_rel: @pzz_link.link_rel, link_rss: @pzz_link.link_rss, link_target: @pzz_link.link_target, link_url: @pzz_link.link_url, link_visible: @pzz_link.link_visible, user_id: @pzz_link.user_id }
    end

    assert_redirected_to pzz_link_path(assigns(:pzz_link))
  end

  test "should show pzz_link" do
    get :show, id: @pzz_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_link
    assert_response :success
  end

  test "should update pzz_link" do
    patch :update, id: @pzz_link, pzz_link: { link_description: @pzz_link.link_description, link_image: @pzz_link.link_image, link_name: @pzz_link.link_name, link_notes: @pzz_link.link_notes, link_rating: @pzz_link.link_rating, link_rel: @pzz_link.link_rel, link_rss: @pzz_link.link_rss, link_target: @pzz_link.link_target, link_url: @pzz_link.link_url, link_visible: @pzz_link.link_visible, user_id: @pzz_link.user_id }
    assert_redirected_to pzz_link_path(assigns(:pzz_link))
  end

  test "should destroy pzz_link" do
    assert_difference('PzzLink.count', -1) do
      delete :destroy, id: @pzz_link
    end

    assert_redirected_to pzz_links_path
  end
end
