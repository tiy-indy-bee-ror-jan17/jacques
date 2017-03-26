Rails.application.routes.draw do

  root to: redirect(
    Rails.env.production? ? 'https://davegregg.github.io/jacques-frontend/' : 'http://localhost:8000/'
  )

  scope '/api' do
    resources :users, only: [:create]
    resources :notes, only: [:create, :index]
    get '/notes/tag/:name' => 'tags#show'
  end

end
