Rails.application.routes.draw do

  resources :taggings
  resources :tags
  resources :notes
  resources :users


  get '/api/notes'  => 'notes#index'
  post '/api/users'   => 'users#create'
  post '/api/notes' => 'notes#create'
  get '/api/notes/tag/:name' => 'notes#show'
  get '/api/notes.json' => 'notes#show'




end
