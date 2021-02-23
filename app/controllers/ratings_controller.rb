class RatingsController < ApplicationController

  def index
    @ratings = Rating.all
  end
  
  
  def new
    @rating = Rating.new
  end
  
  def edit
    @rating = Rating.find(params[:id])
  end
  
  def update
    @rating = Rating.find(params[:id])
    @rating.update(title:params[:rating][:number], author:params[:rating][:comment])
    redirect_to rating_path(@rating)
  
  end
  
  # def create
  #   @rating = Rating.new(rating_params)
  # end
    
  def show
    @rating = Rating.find(params[:id])
  end
end
# def new
#   @rating = Rating.new
# end

def create
  @rating = current_user.ratings.build(rating_params(:number,:comment))
  if @rating.save
    redirect_to rating_path(@rating)
  else
    render :new
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

# private

# def rating_params
#   params.require(:rating).permit(:book)
# end
