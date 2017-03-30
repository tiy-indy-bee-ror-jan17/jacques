Rails.application.routes.draw do

  root 'application#static'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope :api do
    resources :notes, only: [:create, :index]
    resources :users, only: [:create]
    get "/notes/tag/:id" => 'tags#show'
    resources :carts do
      resources :line_items
    end
  end

  get "/:segewr(/:regret)(/:sehetr)" => 'application#static'

end
