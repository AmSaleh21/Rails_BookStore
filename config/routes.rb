Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"

  resources :books

  get "sign-up" , to: "registrations#new"
  post "sign-up", to: "registrations#create"

  get "sign-in" , to: "sessions#new"
  post "sign-in", to: "sessions#create"

  delete "logout",to: "sessions#destroy"

end
