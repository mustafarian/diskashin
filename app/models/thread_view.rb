class ThreadView < ApplicationRecord
  validates :viewer, presence: true
  validates :thread, presence: true

  belongs_to :thread, class_name: "DiscussionThread", foreign_key: 'thread_id'
  belongs_to :viewer, class_name: "User", foreign_key: 'viewer_id'
end
