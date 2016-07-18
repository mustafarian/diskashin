class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email_address, presence: true
  validates :email_address, uniqueness: true

  has_secure_password
end
