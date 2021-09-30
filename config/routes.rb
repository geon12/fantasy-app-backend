Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :leagues

  post "/signup",to: "users#create"
  get "/profile",to: "users#show"
  patch "/profile", to: "users#update"
end
