class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :username, uniqeness: true
end
