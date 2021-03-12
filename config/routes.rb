Rails.application.routes.draw do
  #route file gets read in order so it's important to
  #put new route above show route
  root 'sessions#welcome'
  #get '/ratings/best,' to 'ratings#best', as: 'best_rating'
  resources :ratings, only: [:new, :create, :show, :index]
  resources :books, only: [:new, :create, :show, :index] do
    resources :ratings, shallow: true
  end
  resources :users
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  
  #new will render the form
  get '/login', to: 'sessions#new'
  #create will process the form once you submit it
  get '/logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  post '/', to: 'sessions#create'
  post '/ratings/new', to: 'ratings#index'
  #get '/sessions', to: 'sessions#home' 
  
  #post '/ratings/best,' to 'ratings#best', as: 'best_rating'
  #get '/users/:id', to: 'user#show', as: 'user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#'/users/chrissy_t/shoes'
#'/users/2/shoes'

end

#which one of these qualifies as a nested route?