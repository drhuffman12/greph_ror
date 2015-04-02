require 'test_helper'

class FoundFilesControllerTest < ActionController::TestCase
  setup do
    @found_file = found_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:found_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create found_file" do
    assert_difference('FoundFile.count') do
      post :create, found_file: { found_file_path: @found_file.found_file_path }
    end

    assert_redirected_to found_file_path(assigns(:found_file))
  end

  test "should show found_file" do
    get :show, id: @found_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @found_file
    assert_response :success
  end

  test "should update found_file" do
    patch :update, id: @found_file, found_file: { found_file_path: @found_file.found_file_path }
    assert_redirected_to found_file_path(assigns(:found_file))
  end

  test "should destroy found_file" do
    assert_difference('FoundFile.count', -1) do
      delete :destroy, id: @found_file
    end

    assert_redirected_to found_files_path
  end
end
