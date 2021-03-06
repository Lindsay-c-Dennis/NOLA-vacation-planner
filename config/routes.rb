Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  delete '/sessions', to: 'sessions#destroy'
  delete '/visits', to: 'visits#destroy'
  post '/visits', to: 'visits#create'
  post '/reviews', to: 'reviews#create'
  post '/users/:id/reviews/:id/edit', to: 'reviews#edit'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/recent_reviews', to: 'reviews#recent_reviews'

  resources :landmarks
  resources :reviews, only: [:edit, :destroy]
  resources :landmarks, only: [:show, :index] do
  	resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :users do 
  	resources :reviews, only: [:index, :destroy]
  end

  resources :categories 

  resources :neighborhoods
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
