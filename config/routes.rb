Rails.application.routes.draw do
#write custom routes ABOVE
  get '/signup' => 'users#new'
  # post '/signup' => 'users#create'


  resources :comments
  resources :art_pieces
  resources :challenges
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
