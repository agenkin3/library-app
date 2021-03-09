class BooksController < ApplicationController

def index
  @books = Book.all
end


def new
  @book = Book.new
end

def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:book][:title])
  @book.update(title:params[:book][:title], author:params[:book][:author])
  redirect_to book_path(@book)

end

def create
  #@book = Book.new(title:params[:book][:title], author:params[:book][:author])
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
  end

end
  
def show
  @book = Book.find(params[:id])
end

def destroy 
  @book.destroy
  redirect_to root_path
end 

# def create
#   #make a new shoe instance
# @book = Book.new(book_params)
#   #try to save it. validations are run on save
# if @book.save
# redirect_to book_path(@book)
# else
#     render :new
# end
# end

private

def book_params
  params.require(:book).permit(:title, :author)
end
# #def best
#   #book with best rating
end





