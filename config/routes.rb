RailsLiveDashboard::Engine.routes.draw do
  root to: "home#show"

  resource :home, only: [:show], controller: :home
  resources :requests, only: [:index, :show]
  resources :exceptions, only: [:index, :show]
end
