Rails.application.routes.draw do
  resources :adds
  resources :users_bikes
  resources :bikes
  resources :users
  resources :cars
  resources :cars_owners
  resources :profiles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # QueryMethods
  get "/QueryMethods", to: "users_bikes#QueryMethods"

  # Defines the root path route ("/")
  # root "posts#index"
end
