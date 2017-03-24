Rails.application.routes.draw do
  #also gets users if api token is included
  get  'api/notes'          => 'notes#index'
  post 'api/notes'          => 'notes#create'
  get  'api/notes/tag/:tag' => 'notes#index' #'tag#show'


  post '/api/users'         => 'users#create'
  post '/api/login'         => 'users#login'


end
