Rails.application.routes.draw do
#write custom routes ABOVE

  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout
  delete '/logout' => 'sessions#destroy'

  # get '/auth/:provider/callback' => 'sessions#omniauth'

  


  

  resource :comments

  resources :art_works do
    resources :comments
  end

    # resources :articles do
    #   resources :comments, shallow: true
    # end

    # , only: [:new,:create]
 

 

  resources :challenges do
    resources :art_works, only: [:new, :index, :show, :create]
  end

  resources :users do
    resources :art_works, only: [:new, :index, :show, :create]
  end

 













  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
