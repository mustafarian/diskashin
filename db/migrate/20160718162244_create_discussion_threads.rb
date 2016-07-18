class CreateDiscussionThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :discussion_threads do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
