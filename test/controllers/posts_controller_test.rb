require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @discussion_thread = discussion_threads(:one)
    @post = posts(:one)
    @user = users(:user_1)
  end

  test "should create post" do
    params = {post: {body: @post.body}, discussion_thread_id: @discussion_thread.id}
    assert_difference('Post.count') do
      post :create, params: params, session: {user_id: @user.id}
    end

    post = assigns(:post)
    assert post.persisted?

    assert_redirected_to discussion_thread_url(post.thread)
  end

end
