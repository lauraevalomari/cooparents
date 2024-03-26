require "test_helper"

class FichiersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fichiers_index_url
    assert_response :success
  end

  test "should get show" do
    get fichiers_show_url
    assert_response :success
  end

  test "should get new" do
    get fichiers_new_url
    assert_response :success
  end

  test "should get edit" do
    get fichiers_edit_url
    assert_response :success
  end

  test "should get create" do
    get fichiers_create_url
    assert_response :success
  end

  test "should get update" do
    get fichiers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get fichiers_destroy_url
    assert_response :success
  end
end
