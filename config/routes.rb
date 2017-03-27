Rails.application.routes.draw do

  get "api/notes" => 'notes#index'
  get "api/notes/tag/:tag" => 'tags#index'
  post "api/notes" => 'notes#create'
  post "api/users" => 'users#create'

end
