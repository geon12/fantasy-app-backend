Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :leagues do
    resources :free_agents, only: [:index]
  end
  resources :fantasy_teams
  resources :team_players, only: [:create,:destroy]
  #get "/free_agents", to: "free_agents#index"

  post "/signup", to: "users#create"
  post '/login', to: 'auth#create'
  get "/profile", to: "users#show"
  patch "/profile", to: "users#update"
end
