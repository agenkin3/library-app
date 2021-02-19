class Book < ApplicationRecord
validates :name, presence: true
has_many :user
has_many :rating
end
