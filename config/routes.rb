Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'sessions#home'

  #signup
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook_login'

  #login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout
  delete '/logout' => 'sessions#destroy'

  resources :art_works do
    resources :comments
     end

  resource :comments

  resources :challenges do
    resources :art_works, shallow: true
  end

  resources :users do
    resources :art_works, shallow: true
  end

end
