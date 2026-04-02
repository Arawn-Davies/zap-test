require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login page" do
    get login_url
    assert_response :success
  end

  test "should login with valid credentials" do
    post login_url, params: { username: "admin", password: "admin" }
    assert_redirected_to admin_root_url
  end

  test "should reject invalid credentials" do
    post login_url, params: { username: "admin", password: "wrong" }
    assert_response :unprocessable_entity
  end

  test "should logout" do
    post login_url, params: { username: "admin", password: "admin" }
    delete logout_url
    assert_redirected_to root_url
  end
end
