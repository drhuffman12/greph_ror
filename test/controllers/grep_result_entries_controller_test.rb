require 'test_helper'

class GrepResultEntriesControllerTest < ActionController::TestCase
  setup do
    @grep_result_entry = grep_result_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grep_result_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grep_result_entry" do
    assert_difference('GrepResultEntry.count') do
      post :create, grep_result_entry: { found_file_path: @grep_result_entry.found_file_path, found_line_num: @grep_result_entry.found_line_num, found_line_string: @grep_result_entry.found_line_string, grep_raw_id: @grep_result_entry.grep_raw_id }
    end

    assert_redirected_to grep_result_entry_path(assigns(:grep_result_entry))
  end

  test "should show grep_result_entry" do
    get :show, id: @grep_result_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grep_result_entry
    assert_response :success
  end

  test "should update grep_result_entry" do
    patch :update, id: @grep_result_entry, grep_result_entry: { found_file_path: @grep_result_entry.found_file_path, found_line_num: @grep_result_entry.found_line_num, found_line_string: @grep_result_entry.found_line_string, grep_raw_id: @grep_result_entry.grep_raw_id }
    assert_redirected_to grep_result_entry_path(assigns(:grep_result_entry))
  end

  test "should destroy grep_result_entry" do
    assert_difference('GrepResultEntry.count', -1) do
      delete :destroy, id: @grep_result_entry
    end

    assert_redirected_to grep_result_entries_path
  end
end
