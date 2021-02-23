class Rating < ApplicationRecord
  # validates :number, presence: true
  belongs_to :user
  belongs_to :book
  # scope :order_by_number, -> {order(:number)}
  # scope :good_rating, -> {where("number > 3")}
  # scope :search_by_number, -> (search_number){where("number = ?",search_number)}


end
