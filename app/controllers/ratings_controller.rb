class RatingsController < ApplicationController
  before_action :set_shoe, :redirect_if_not_owner, only: [:show, :edit, :update, :destroy]
  
  def create
    @rating = Rating.new(rating_params)
    @rating = current_user.shoes.build(rating_params)

    if @rating.save
      redirect_to rating_path(@rating)
    else
      @book = Book.find_by_id(@book)
      render :new
    # @rating = Rating.new
    # # if @rating.save
    #   redirect_to rating_path(@rating)
    # else
    #   #insert flash message here 
    #   render :new
    # end
    end
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def index
    @ratings = Rating.all
  end
  
  def new
    @rating = Rating.new
  end
  
  def edit
    @rating = Rating.find(params[:id])
    if current_user != @rating.user
      redirect_to user_path(current_user) 
    end
    end
  
  def update
    @rating = Rating.find(params[:id])
    @rating.update(title:params[:rating][:number], author:params[:rating][:comment])
    redirect_to rating_path(@rating)
  end

  def destroy
    @rating.destroy
    redirect_to ratings_path
  end
    
  def highest
    @rating = Rating.ordered_by_number.first
  end


  private

  def rating_params
    params.require(:rating).permit(:number, :comment)
  end

  def redirect_if_not_owner
    if current_user != @rating.user
      redirect_to user_path(current_user)
    end
  end

    def set_shoe
      shoe = Shoe.find(params[:id])
    end

end




# def index
#   if params[:number]
#     @rating = Rating.search_by_number(params[:number]).order_by_number
#     @rating = Rating.order_by_number if @ratings == []
#   else
#     @ratings = Rating.order_by_number
#   end
# end

# def show
#   set_rating
# end

# def edit
#   set_rating
# end

# def destroy
#   set_rating
#   @rating.destroy
# end