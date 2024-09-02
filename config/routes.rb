Rails.application.routes.draw do
  root 'users/dashboard#show'

namespace :users do
    resources :registrations, only: [:new, :create]
    #resources :login, only: [:new, :create, :destroy]
get 'login', to: "login#new"
post 'login', to: "login#create"
delete 'logout', to: "login#destroy"

#dashboard routes
get '/dashboard', to: "dashboard#show"
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
