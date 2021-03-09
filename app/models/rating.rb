class Rating < ApplicationRecord
  validates :number, presence: true
  validates :comment, presence: true
  belongs_to :user
  belongs_to :book
  # could also do scope :order_by_number, => {order(number: :desc)}
  

  def self.ordered_by_number
    self.order(number: :desc)
    #@self.all.sort_by{|rating|rating.number}.last
  end

  def rating_attributes=(attr)
    if !attr[:number].blank?
      self.rating = Rating.find_by_or_create_by(number: attr[:number])
    end
    end
  end