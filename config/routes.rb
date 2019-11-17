Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  #this way, sign up page URL is /signup
  get 'add_film', to: 'films#new'
  resources :users
  resources :films, only: [:index, :show, :create]
end
