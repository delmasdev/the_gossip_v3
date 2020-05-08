Rails.application.routes.draw do

  resources :gossips
  resources :comments
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :likes
  resources :cities

  get '/welcome/:id', to: 'welcome#index', as: 'welcome_id'
  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'

  post '/users/create', to: 'users#create'
  post '/sessions/create', to: 'sessions#create'
  post '/likes/create', to: 'likes#create'
  post '/gossips/comments/create', to: 'comments#create'
  post '/gossips/likes/create', to: 'likes#create'
end
