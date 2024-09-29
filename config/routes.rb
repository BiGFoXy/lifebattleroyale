Rails.application.routes.draw do
  root 'sessions#home'

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/register', to: 'users#register'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/show/:id', to: 'users#show'

  get '/play', to: 'games#play'
  get '/start', to: 'games#start'
  get '/win', to: 'games#win'
  post '/next', to: 'games#next'
  get '/artifacts_info', to: 'games#artifact_info'
  get '/restart', to: 'games#restart'

  post '/create', to: 'characters#create'
  get '/delete', to: 'characters#delete'




end
