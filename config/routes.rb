Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new', as: 'login'
  get '/signup', to: 'users#new', as: 'signup'
  resources :categories
  resources :neighborhoods
  resources :landmarks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
