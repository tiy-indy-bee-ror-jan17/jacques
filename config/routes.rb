Rails.application.routes.draw do

  get '/api/notes' => 'notes#index'
  get '/api/notes/:id' => 'notes#show'
  post '/api/notes' => 'notes#create'
  get '/api/notes/tag/:id' => 'tags#by_tag'
  post '/api/users' => 'users#create'
  put '/api/notes/:id' => 'notes#update'
  get '/' => 'notes#welcome'

end
