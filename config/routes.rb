Rails.application.routes.draw do

  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook_login'

  #login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout
  delete '/logout' => 'sessions#destroy'

  # get '/auth/:provider/callback' => 'sessions#omniauth'


  resources :art_works do
    resources :comments
     end

  resource :comments

  resources :challenges do
    resources :art_works, shallow: true
  end

  # resources :users do
  #   resources :art_works, only: [:new, :index, :show, :create]
  # end

  resources :users do
    resources :art_works, shallow: true
  end

  #for Github 
  # get '/auth/github/callback', to: 'sessions#github_login'


  # get '/auth/facebook/callback' => 'sessions#facebook_login'


  # get '/auth/github/callback', to: 'sessions#create'
  # match '/auth/github/callback', to: 'sessions#github_login', via: [:get, :post]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
