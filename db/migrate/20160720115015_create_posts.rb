class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.timestamps
    end

    add_reference :posts, :author, references: :users, index: true
    add_foreign_key :posts, :users, column: :author_id

    add_reference :posts, :thread, references: :discussion_thread, index: true
    add_foreign_key :posts, :discussion_threads, column: :thread_id
  end
end
