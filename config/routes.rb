Rails.application.routes.draw do
  resources :users
  post '/signup', to: 'users#create', as: :signup
  post '/login', to: 'sessions#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
end
