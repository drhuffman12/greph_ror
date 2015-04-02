require 'test_helper'

class GrepRawsControllerTest < ActionController::TestCase
  setup do
    @grep_raw = grep_raws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grep_raws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grep_raw" do
    assert_difference('GrepRaw.count') do
      post :create, grep_raw: { error_log: @grep_raw.error_log, result_set: @grep_raw.result_set, search_path: @grep_raw.search_path, search_term: @grep_raw.search_term }
    end

    assert_redirected_to grep_raw_path(assigns(:grep_raw))
  end

  test "should show grep_raw" do
    get :show, id: @grep_raw
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grep_raw
    assert_response :success
  end

  test "should update grep_raw" do
    patch :update, id: @grep_raw, grep_raw: { error_log: @grep_raw.error_log, result_set: @grep_raw.result_set, search_path: @grep_raw.search_path, search_term: @grep_raw.search_term }
    assert_redirected_to grep_raw_path(assigns(:grep_raw))
  end

  test "should destroy grep_raw" do
    assert_difference('GrepRaw.count', -1) do
      delete :destroy, id: @grep_raw
    end

    assert_redirected_to grep_raws_path
  end
end
