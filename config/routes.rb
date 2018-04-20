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

  
  resources :reviews, only: [:edit]
  resources :landmarks, only: [:show] do
  	resources :reviews, only: [:index, :new, :create]
  end

  resources :users, only: [:show, :index] do 
  	resources :reviews, only: [:show, :index, :new, :edit, :update, :destroy]
  end

  resources :categories 

  resources :neighborhoods
  resources :landmarks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
