Rails.application.routes.draw do
  
  
  

  root 'pages#home'
  get '/news', to: 'pages#news'
  get '/pizza', to: 'pages#pizza'
  get '/about', to: 'pages#about'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
