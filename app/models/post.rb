class Post < ApplicationRecord
  validates :thread_id, presence: true
  validates :author_id, presence: true
  validates :body, presence: true

  belongs_to :thread, class_name: 'DiscussionThread', foreign_key: 'thread_id', touch: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :attachments, as: :attachable, :dependent => :destroy
end
