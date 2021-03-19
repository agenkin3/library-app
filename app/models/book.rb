class Book < ApplicationRecord
  #validations exist in the model 
validates :title, presence: true, uniqueness: true
validates :author, presence: true
has_many :ratings
has_many :users, through: :ratings
accepts_nested_attributes_for :ratings


def title_and_author
  "#{self.title} - #{self.author}"
end

end
