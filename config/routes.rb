Rails.application.routes.draw do

  get '/api/notes' => 'notes#index'
  post '/api/notes' => 'notes#create'
  get '/api/notes/tag/:id' => 'notes#by_tag'
  post '/api/users' => 'users#create'
  get '/' => 'notes#welcome'

end
