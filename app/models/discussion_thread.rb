class DiscussionThread < ApplicationRecord
  validates :title, presence: true
  validates :author_id, presence: true

  belongs_to :board, class_name: 'Board'
  belongs_to :author, class_name: 'User'

  has_many :replies, class_name: 'Post', foreign_key: 'thread_id', dependent: :destroy
end
