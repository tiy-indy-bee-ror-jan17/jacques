Rails.application.routes.draw do

  # resources :notes
  # resources :users

  scope '/api' do
    get    '/notes.json'      => 'notes#index'
    get    '/notes'           => 'notes#index'
    post   '/users'           => 'users#create'
    post   '/notes'           => 'notes#create'
    get    '/notes/tag/:name' => 'tags#show'
    get    '/login'           => 'sessions#new',       as: 'login'
    post   '/login'           => 'sessions#create'
    delete '/logout'          => 'sessions#destroy',   as: 'logout'
  end
  
end
