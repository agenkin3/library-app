# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create([
  {title: "My Favorite Book", author: "My Favorite Author"},
  {title: "In Search of Lost Time", author: "Marcel Proust"},
  {title: "War and Peace", author: "Leo Tolstoy"},
  {title: "The Brothers Karamazov", author: "Fyoder Dostoyevsky"}
])

Rating.create([
{number: 3, comment: "this book is ok", book_id: 1, user_id: 1},
{number: 2, comment: "this book is bad", book_id: 2, user_id: 1},
])

User.create([
  {username: "User1", email: "user@user.com", password: "password" 
  }
])