require 'test_helper'

class BoardsControllerTest < ActionController::TestCase
  setup do
    @board = boards(:board_2)
    @user = users(:user_1)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create board" do
    assert_difference('Board.count') do
      post :create,
           params: {board: {description: @board.description, title: @board.title}},
           session: {user_id: @user.id}
    end

    assert_redirected_to board_url(Board.last)
  end

  test "should create sub-board" do

    assert_difference('Board.count') do
      post :create,
           params: {board: {description: "Child board", title: "sub-board", parent_id: @board.id}},
           session: {user_id: @user.id}
    end

    sub_board = Board.find_by(:title => "sub-board")
    assert(sub_board.parent, "Parent board not set.")
    assert(sub_board.parent.id == @board.id, "Unexpected parent board id.")
    assert_redirected_to edit_board_url(@board)
  end

  test "should show board" do
    get :show, params: {id: @board.id}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @board.id}, session: {user_id: @user.id, roles: ["admin"]}
    assert_response :success
  end

  test "should update board" do
    patch :update,
          params: {id: @board.id, board: {description: @board.description, title: @board.title}},
          session: {user_id: @user.id}

    assert_redirected_to board_url(@board)
  end

  test "should destroy board" do
    assert_difference('Board.count', -1) do
      delete :destroy, params: {id: @board.id}, session: {user_id: @user.id}
    end

    assert_redirected_to boards_url
  end
end
