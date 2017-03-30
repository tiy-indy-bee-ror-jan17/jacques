Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope :api do
    resources :notes, only: [:create, :index]
    resources :users, only: [:create]
    get "/notes/tag/:id" => 'tags#show'
  end
end
