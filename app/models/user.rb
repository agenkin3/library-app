class User < ApplicationRecord
  has_secure_password
  has_many :ratings
  has_many :books, through: :ratings
  validates :username, presence: true
  validates :username, uniqueness: true
end
