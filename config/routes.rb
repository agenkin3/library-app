Rails.application.routes.draw do
  #route file gets read in order so it's important to
  #put new route above show route
  root 'sessions#welcome'
  resources :ratings
  resources :books
  
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  #new will render the form
  get '/login', to: 'sessions#new'
  #create will process the form once you submit it
  get '/logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/', to: 'sessions#create'
  #get '/sessions', to: 'sessions#home' 
  #get '/books/best,' to 'books#best', as: 'best_book'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#which one of these qualifies as a nested route?