class DiscussionThread < ApplicationRecord
  validates :title, presence: true
  validates :author_id, presence: true

  belongs_to :board, class_name: 'Board', touch: true
  belongs_to :author, class_name: 'User'

  has_many :replies, class_name: 'Post', foreign_key: 'thread_id', dependent: :destroy
  has_many :views, class_name: 'ThreadView', foreign_key: 'thread_id', dependent: :destroy

  has_many :viewers, class_name: 'User', :through => :views

  has_many :attachments, as: :attachable, :dependent => :destroy

  def post_count
    Rails.cache.fetch [self, "post_count"] do
      replies.count
    end
  end

  def view_count
    Rails.cache.fetch [self, "view_count"] do
      views.count
    end
  end
end
