require "test_helper"

class Users::LoginControllerTest < ActionDispatch::IntegrationTest


  test "should get new" do
    get users_login_url
    assert_response :success
    assert_template :new
  end

test "when user written wrong login parameters should be alert" do
post users_login_url, params: {user: {email: "dotnet@domainet.com", password: "pas"}}
assert_template :new
assert_equal "wrong login parameters", flash[:alert]
end
end
