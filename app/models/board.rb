class Board < ApplicationRecord
  validates :title, presence: true

  has_many :sub_boards, class_name: 'Board', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Board', optional: true
end
