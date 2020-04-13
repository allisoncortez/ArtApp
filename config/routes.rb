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

  resources :comments
  
  resources :art_works do
    resources :comments
  end

  # resources :challenges

  resources :challenges do
    resources :art_works, only: [:new,:create,:index]
  end

  resources :users do
    resources :art_works, only: [:new,:create,:index, :show]
  end


  # posts/:post_id/comments
  # posts/:post_id/comments/new










  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
