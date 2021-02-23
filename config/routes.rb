Rails.application.routes.draw do
  #route file gets read in order so it's important to
  #put new route above show route

  root 'sessions#home'
  resources :ratings
  resources :users
  resources :books
  # get '/login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  # post '/signup', to: 'users#create'
  post '/', to: 'sessions#home'
  # get'/sessions', to: 'sessions#home' 
  #get '/auth/facebook/callback', to: 'sessions#create'
  #get '/books/best,' to 'books#best', as: 'best_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
#new will render the form
#create will process the form once you submit it