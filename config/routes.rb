Rails.application.routes.draw do

  get  '/api/notes' => 'notes#index'
  post '/api/notes' => 'notes#create'

  get  '/api/notes/tag/:name' => 'tags#show'

  get  '/api/users' => 'users#index'
  post '/api/users' => 'users#create'


end
