Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  #this way, sign up page URL is /signup
  resources :users
end
