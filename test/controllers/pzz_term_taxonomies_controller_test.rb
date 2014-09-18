require 'test_helper'

class PzzTermTaxonomiesControllerTest < ActionController::TestCase
  setup do
    @pzz_term_taxonomy = pzz_term_taxonomies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pzz_term_taxonomies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pzz_term_taxonomy" do
    assert_difference('PzzTermTaxonomy.count') do
      post :create, pzz_term_taxonomy: { count: @pzz_term_taxonomy.count, taxonomy_description: @pzz_term_taxonomy.taxonomy_description, taxonomy_name: @pzz_term_taxonomy.taxonomy_name, taxonomy_parent_id: @pzz_term_taxonomy.taxonomy_parent_id, term_id: @pzz_term_taxonomy.term_id }
    end

    assert_redirected_to pzz_term_taxonomy_path(assigns(:pzz_term_taxonomy))
  end

  test "should show pzz_term_taxonomy" do
    get :show, id: @pzz_term_taxonomy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pzz_term_taxonomy
    assert_response :success
  end

  test "should update pzz_term_taxonomy" do
    patch :update, id: @pzz_term_taxonomy, pzz_term_taxonomy: { count: @pzz_term_taxonomy.count, taxonomy_description: @pzz_term_taxonomy.taxonomy_description, taxonomy_name: @pzz_term_taxonomy.taxonomy_name, taxonomy_parent_id: @pzz_term_taxonomy.taxonomy_parent_id, term_id: @pzz_term_taxonomy.term_id }
    assert_redirected_to pzz_term_taxonomy_path(assigns(:pzz_term_taxonomy))
  end

  test "should destroy pzz_term_taxonomy" do
    assert_difference('PzzTermTaxonomy.count', -1) do
      delete :destroy, id: @pzz_term_taxonomy
    end

    assert_redirected_to pzz_term_taxonomies_path
  end
end
