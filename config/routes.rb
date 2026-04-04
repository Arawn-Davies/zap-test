Rails.application.routes.draw do
  # Public blog routes
  root "posts#index"
  resources :posts, only: [ :index, :show ]

  # Authentication
  get    "login",  to: "sessions#new",     as: :login
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  get "about", to: "pages#about"

  # Admin area
  namespace :admin do
    root "dashboard#index"
    resources :posts, :users
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
