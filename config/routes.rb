RailsLiveDashboard::Engine.routes.draw do
  root to: "dashboard#show"

  resource :dashboard, only: [:show], controller: :dashboard
  resource :clean, only: [:destroy], controller: :clean
  resources :requests, only: [:index, :show]
  resources :exceptions, only: [:index, :show]
end
