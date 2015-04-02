require 'test_helper'

class GrepMultisControllerTest < ActionController::TestCase
  setup do
    @grep_multi = grep_multis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grep_multis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grep_multi" do
    assert_difference('GrepMulti.count') do
      post :create, grep_multi: { search_paths: @grep_multi.search_paths, search_terms: @grep_multi.search_terms }
    end

    assert_redirected_to grep_multi_path(assigns(:grep_multi))
  end

  test "should show grep_multi" do
    get :show, id: @grep_multi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grep_multi
    assert_response :success
  end

  test "should update grep_multi" do
    patch :update, id: @grep_multi, grep_multi: { search_paths: @grep_multi.search_paths, search_terms: @grep_multi.search_terms }
    assert_redirected_to grep_multi_path(assigns(:grep_multi))
  end

  test "should destroy grep_multi" do
    assert_difference('GrepMulti.count', -1) do
      delete :destroy, id: @grep_multi
    end

    assert_redirected_to grep_multis_path
  end
end
