RailsLiveDashboard::Engine.routes.draw do
  root to: 'dashboard#show'

  resource :dashboard, only: [:show], controller: :dashboard
  resource :clean, only: [:destroy], controller: :clean
  resources :requests, only: %i[index show]
  resources :exceptions, only: %i[index show]
end
