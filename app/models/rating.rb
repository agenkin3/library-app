class Rating < ApplicationRecord
  validates :number, presence: true
  belongs_to :user
  belongs_to :book

  scope :order_by_number, -> {order(:number)}
  scope :good_rating, -> {where("number > 3")}

  scope :search_by_number, -> (search_number){where("number = ?",search_number)}

  def new 
    @rating = Rating.new
  end

  def create
    @rating = current_user.ratings.build(rating_params(:number, :comment))
  if @rating.save
  redirect_to rating_path(@rating)
  else
    render :new
  end
  end


  def index
    if params[:number]
      @rating = Rating.search_by_number(params[:number]).order_by_number
      @rating = Rating.order_by_number if @ratings = []
    else
      @ratings = Rating.order_by_number
    end
  end
  
  def show
    set_pet
  end

  def edit
    set_pet
  end




end
