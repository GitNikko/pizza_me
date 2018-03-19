Rails.application.routes.draw do
  
  get 'restaurants/new'
  get 'restaurants/show'

  root 'pages#home'
  get '/news', to: 'pages#news'
  get '/pizza', to: 'pages#pizza'
  get '/about', to: 'pages#about'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/show', to: 'users#show'
  
  get '/login', to: 'sessions#new'
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'restaurants/new', to: 'restaurants#new'
  post 'restaurants/new', to: 'restaurants#create'
  get 'restaurants/show', to: 'restaurants#show'
  get 'restaurants/index', to: 'restaurants#index'
  
  #get 'password_resets/new'
  #get 'password_resets/edit'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
