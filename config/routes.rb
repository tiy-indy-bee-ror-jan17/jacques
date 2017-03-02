Rails.application.routes.draw do

  get '/api/notes.json' => 'notes#index'
  get '/api/notes/tag/:id' => 'tags#show'
  post '/api/notes' => 'notes#create'
  post '/api/users' => 'users#create'
  get '/api/notes' => 'notes#index'

end
