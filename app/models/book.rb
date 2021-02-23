class Book < ApplicationRecord
validates :title, presence: true
has_many :users
has_many :ratings

def title_and_author
  "#{self.title} - #{self.author}"
end

end
