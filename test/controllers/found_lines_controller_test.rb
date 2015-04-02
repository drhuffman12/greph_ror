require 'test_helper'

class FoundLinesControllerTest < ActionController::TestCase
  setup do
    @found_line = found_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:found_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create found_line" do
    assert_difference('FoundLine.count') do
      post :create, found_line: { found_file_id: @found_line.found_file_id, found_line_num: @found_line.found_line_num }
    end

    assert_redirected_to found_line_path(assigns(:found_line))
  end

  test "should show found_line" do
    get :show, id: @found_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @found_line
    assert_response :success
  end

  test "should update found_line" do
    patch :update, id: @found_line, found_line: { found_file_id: @found_line.found_file_id, found_line_num: @found_line.found_line_num }
    assert_redirected_to found_line_path(assigns(:found_line))
  end

  test "should destroy found_line" do
    assert_difference('FoundLine.count', -1) do
      delete :destroy, id: @found_line
    end

    assert_redirected_to found_lines_path
  end
end
