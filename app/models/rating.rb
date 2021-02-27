class Rating < ApplicationRecord
  validates :number, presence: true
  belongs_to :user
  belongs_to :book
  # scope :order_by_number, => {order(number: :desc)}
  

  def self.order_by_number
    self.order(number: :desc)
  end

  def rating_attributes=(attr)
    if !attr[:number].blank?
      self.rating = Rating.find_by_or_create_by(number: attr[:number])
    end
    end
  end