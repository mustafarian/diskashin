require 'test_helper'

class DiscussionThreadsControllerTest < ActionController::TestCase
  setup do
    @discussion_thread = discussion_threads(:one)
    @board = boards(:board_2)
    @user = users(:user_1)
  end

  test "should get new" do
    get :new, params: {:board_id => @board.id}

    discussion_thread = assigns(:discussion_thread)
    assert discussion_thread.new_record?

    assert_response :success
  end

  test "should create discussion_thread" do
    params = {discussion_thread: {body: @discussion_thread.body, title: @discussion_thread.title, board_id: @board.id}}
    assert_difference('DiscussionThread.count') do
      post :create, params: params, session: {user_id: @user.id}
    end

    discussion_thread = assigns(:discussion_thread)
    assert discussion_thread.persisted?

    assert_redirected_to discussion_thread_url(DiscussionThread.last)
  end

  test "should show discussion_thread" do
    get :show, params: {id: @discussion_thread.id}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @discussion_thread.id}, session: {user_id: @user.id}
    assert_response :success
  end

  test "should update discussion_thread" do
    patch :update,
          params: {
              id: @discussion_thread.id,
              discussion_thread: {body: @discussion_thread.body, title: @discussion_thread.title}
          }, session: {user_id: @user.id}
    assert_redirected_to discussion_thread_url(@discussion_thread)
  end

  test "should destroy discussion_thread" do
    assert_difference('DiscussionThread.count', -1) do
      delete :destroy, params: {id: @discussion_thread.id}, session: {user_id: @user.id}
    end

    assert_redirected_to board_url(@discussion_thread.board)
  end
end
