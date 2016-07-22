class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true, touch: true

  has_attached_file :image,
                    :path => ":rails_root/public/images/:id/:filename",
                    :url  => "/images/:id/:filename"

  validates_attachment :image, presence: true,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                       size: { in: 0..10000.kilobytes }
end