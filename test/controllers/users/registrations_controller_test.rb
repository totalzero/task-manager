require "test_helper"

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_users_registration_url
    assert_response :success
  end

  test "should flash notice when user create" do
    post "/users/registrations", params: {user: {user_name: "testing user 2name", email: "email@app.com", password: "usr1bin", password_confirmation: "usr1bin"}}
    assert_template :new
    assert_equal "Registration was succesfull", flash[:notice]
  end

  test "should flash alert when user not create" do
    post "/users/registrations", params: {user: {user_name: "testing user 2name", email: "email@app.com", password: "usr1bin", password_confirmation: "usr1b"}}
    assert_template :new
    assert_equal "registration wrong", flash[:alert]
  end

end
