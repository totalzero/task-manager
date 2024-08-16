require "test_helper"

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get rails_generate_url
    assert_response :success
  end

  test "should get controller" do
    get rails_controller_url
    assert_response :success
  end

  test "should get users/registrations" do
    get rails_users/registrations_url
    assert_response :success
  end

  test "should get new" do
    get rails_new_url
    assert_response :success
  end

  test "should get create" do
    get rails_create_url
    assert_response :success
  end
end
