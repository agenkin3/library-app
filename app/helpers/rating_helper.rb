module RatingHelper

def display_header(book)
  if book
      tag.h1("All Ratings for #{@book.title} ")
  else 
      tag.h2("All the Ratings")
  end 
end
end

#we dont have access to instance variables in a helper