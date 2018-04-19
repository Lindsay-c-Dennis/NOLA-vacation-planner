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
  resources :categories do 
  	resources :landmarks, only: [:index]
  end	

  resources :neighborhoods
  resources :landmarks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
