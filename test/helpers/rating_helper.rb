def display_header(book)
  if book
    tag.h1("All #{book.title} Ratings </h1>
  else
    tag.h2 ("All the Ratings")
  end
end

#when I pass it in its an argument, when you pass its a parameter
#tag allows you to write ruby that will generate html 