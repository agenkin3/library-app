class RatingsController < ApplicationController
  #before_action :set_rating, :redirect_if_not_owner, only: [:show, :edit, :update, :destroy]
  
  def create
    @rating = current_user.ratings.build(rating_params)
    if @rating.save
      redirect_to rating_path(@rating)
    else
      render :new
    end
  end 

  def new
    @rating = Rating.new
    #is this a nested route?
    if params[:book_id] && @book = Book.find_by_id(params[:book_id])
      #if so, we only want ratings of that book
      #pre associating the rating to the book if you come from a nested form 
      @ratings = @book.ratings.new
      #if not
    else 
        @ratings = Rating.ordered_by_number
      
        #access just ratings of this book
  
        #if so, we only want ratings of that book
        #if not
        #show all the ratings @ratings = Rating.ordered_by_number
      end 
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def index
    #first, check if this is a nested route 
    if params[:book_id] && @book = Book.find_by_id(params[:book_id])
    @ratings = @book.ratings.ordered_by_number
    else 
      @ratings = Rating.ordered_by_number
      #access just ratings of this book
      #if so, we only want ratings of that book
      #if not, show all the ratings @ratings = Rating.ordered_by_number
    end 
    end
  
  def edit
    @rating = Rating.find(params[:id])
    if current_user != @rating.user
      redirect_to user_path(current_user) 
    end
    end
  
  def update
    @rating = Rating.find(params[:id])
    @rating.update(number:params[:rating][:number], comment:params[:rating][:comment])
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

  def set_rating
    rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:book_id, :number, :comment)
  end

end

