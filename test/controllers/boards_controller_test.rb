require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
  end

  test "should get index" do
    get boards_url
    assert_response :success
  end

  test "should get new" do
    get new_board_url
    assert_response :success
  end

  test "should create board" do
    assert_difference('Board.count') do
      post boards_url, params: { board: { description: @board.description, title: @board.title } }
    end

    assert_redirected_to board_url(Board.last)
  end

  test "should create sub-board" do

    assert_difference('Board.count') do
      post boards_url, params: { board: { description: "Child board", title: "sub-board", parent_id: @board.id } }
    end

    sub_board = Board.find_by(:title => "sub-board")
    assert(sub_board.parent, "Parent board not set.")
    assert(sub_board.parent.id == @board.id, "Unexpected parent board id.")
    assert_redirected_to edit_board_url(@board)
  end

  test "should show board" do
    get board_url(@board)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_url(@board)
    assert_response :success
  end

  test "should update board" do
    patch board_url(@board), params: { board: { description: @board.description, title: @board.title } }
    assert_redirected_to board_url(@board)
  end

  test "should destroy board" do
    assert_difference('Board.count', -1) do
      delete board_url(@board)
    end

    assert_redirected_to boards_url
  end
end
