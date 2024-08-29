require "test_helper"

class Users::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_login_new_url
    assert_response :success
  end

  test "should get create" do
    get users_login_create_url
    assert_response :success
  end

  test "should get destroy" do
    get users_login_destroy_url
    assert_response :success
  end
end
