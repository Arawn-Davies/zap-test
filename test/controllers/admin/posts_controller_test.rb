require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Log in as admin before each test
    post login_url, params: { username: "admin", password: "admin" }
  end

  test "should get admin posts index" do
    get admin_posts_url
    assert_response :success
  end

  test "should get new post form" do
    get new_admin_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post admin_posts_url, params: { post: { title: "New Post", body: "Body text.", published_at: Time.current } }
    end
    assert_redirected_to admin_posts_url
  end

  test "should get edit form" do
    blog_post = posts(:hello_world)
    get edit_admin_post_url(blog_post)
    assert_response :success
  end

  test "should update post" do
    blog_post = posts(:hello_world)
    patch admin_post_url(blog_post), params: { post: { title: "Updated Title" } }
    assert_redirected_to admin_posts_url
  end

  test "should destroy post" do
    blog_post = posts(:hello_world)
    assert_difference("Post.count", -1) do
      delete admin_post_url(blog_post)
    end
    assert_redirected_to admin_posts_url
  end

  test "should redirect non-admin to root" do
    delete logout_url
    get admin_posts_url
    assert_redirected_to login_url
  end
end
