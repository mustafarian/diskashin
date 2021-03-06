class Board < ApplicationRecord
  validates :title, presence: true

  has_many :sub_boards, class_name: 'Board', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Board', optional: true, touch: true


  has_many :threads, class_name: 'DiscussionThread', foreign_key: 'board_id'

  def thread_count
    Rails.cache.fetch [self, "thread_count"] do
      thread_count = threads.count

      sub_boards.each do |sub_board|
        thread_count = thread_count + sub_board.threads.count
      end
      thread_count
    end
  end

  def post_count
    Rails.cache.fetch [self, "post_count"] do
      post_count = 0

      threads.each do |thread|
        post_count = post_count + thread.replies.count + 1
      end

      sub_boards.each do |sub_board|
        sub_board.threads.each do |thread|
          post_count = post_count + thread.replies.count + 1
        end
      end
      post_count
    end
  end
end
