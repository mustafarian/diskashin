require 'test_helper'

class DiscussionThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discussion_thread = threads(:one)
  end

  test "should get index" do
    get threads_url
    assert_response :success
  end

  test "should get new" do
    get new_thread_url
    assert_response :success
  end

  test "should create discussion_thread" do
    assert_difference('DiscussionThread.count') do
      post threads_url, params: { discussion_thread: { body: @discussion_thread.body, title: @discussion_thread.title } }
    end

    assert_redirected_to thread_url(DiscussionThread.last)
  end

  test "should show discussion_thread" do
    get thread_url(@discussion_thread)
    assert_response :success
  end

  test "should get edit" do
    get edit_thread_url(@discussion_thread)
    assert_response :success
  end

  test "should update discussion_thread" do
    patch thread_url(@discussion_thread), params: { discussion_thread: { body: @discussion_thread.body, title: @discussion_thread.title } }
    assert_redirected_to thread_url(@discussion_thread)
  end

  test "should destroy discussion_thread" do
    assert_difference('DiscussionThread.count', -1) do
      delete thread_url(@discussion_thread)
    end

    assert_redirected_to threads_url
  end
end
