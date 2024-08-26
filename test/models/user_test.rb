require "test_helper"

class UserTest < ActiveSupport::TestCase
test "testing validations user_name" do
u = User.new
u.email = "example@domain.com"
u.password = "example_password"
u.password_confirmation = "example_password"
assert_not u.save, "user valid"
end

test "checking length user name" do
  u = User.new
  u.user_name = "d"
  u.email = "user@domain.com"
  u.password = "password"
  u.password_confirmation = "password"
  u.valid?
  assert u.errors.full_messages_for(:user_name).to_s.include?("short")
end

test "checking password and password confirmation matching " do
u = User.new
u.user_name = "example_user"
u.email = "example@domain.com"
u.password = "password_"
u.password_confirmation = "_password"
u.valid?
assert_not u.errors.full_messages_for(:password_confirmation).empty?
end
 end
