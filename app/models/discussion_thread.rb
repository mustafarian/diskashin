class DiscussionThread < ApplicationRecord
  validates :title, presence: true

  belongs_to :board, class_name: 'Board'
end
