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


  resources :comments
  resources :users do
    resources :artworks, only: [:new,:create,:index]
  end

  resources :artworks do
    resources :comments
  end

  resources :challenges


  # posts/:post_id/comments
  # posts/:post_id/comments/new










  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
