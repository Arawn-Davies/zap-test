require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should show a published post" do
    post = posts(:hello_world)
    get post_url(post)
    assert_response :success
  end
end
