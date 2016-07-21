class AddUserRefToDiscussionThread < ActiveRecord::Migration[5.0]
  def change
    add_reference :discussion_threads, :author, references: :users, index: true
    add_foreign_key :discussion_threads, :users, column: :author_id
  end
end
