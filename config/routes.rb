Rails.application.routes.draw do

  root 'pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'restaurants/show', to: 'restaurants#show'
  get 'restaurants/index', to: 'restaurants#index'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :reviews, only: [:create, :destroy]

end
