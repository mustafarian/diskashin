class AddBoardRefToDiscussionThread < ActiveRecord::Migration[5.0]
  def change
    add_reference :discussion_threads, :board, foreign_key: true
  end
end
