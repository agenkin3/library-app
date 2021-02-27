class Book < ApplicationRecord
validates :title, presence: true
has_many :ratings
has_many :users, through: :ratings

def title_and_author
  "#{self.title} - #{self.author}"
end

end
