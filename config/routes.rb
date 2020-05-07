Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'gossips#index'

  get '/welcome/:id', to: 'welcome#index', as: 'welcome_id'

  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'


  resources :gossips
  resources :comments
  resources :users

  # get '/gossips', to: 'gossips#index'
  # get '/gossips/new', to: 'gossips#new'
  # post '/gossips', to: 'gossips#create'
  # get '/gossips/:id', to: 'gossips#show', as: 'gossip_id'

  # get '/users/:id', to: 'users#show', as: 'user_id'

  resources :cities


end
