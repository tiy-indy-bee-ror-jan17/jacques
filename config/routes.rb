Rails.application.routes.draw do

  resources :users
  resources :tags
  resources :notes

  get  '/api/notes.json'      => 'notes#index'
  get  '/api/notes'           => 'notes#index'
  post '/api/notes'           => 'notes#create'
  post '/api/users'           => 'users#create'
  get  '/api/notes/tag/:name' => 'tags#show'

  root to: redirect('https://davegregg.github.io/jacques-frontend/')
  # get  '/users'              => 'users#index'
  # post '/users'              => 'users#create'
  # get  '/posts/:id'          => 'posts#show'
  # get  '/posts/:id/comments' => 'posts#index_comments'

end
