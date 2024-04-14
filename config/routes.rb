RailsLiveDashboard::Engine.routes.draw do
  root to: 'dashboard#show'

  resource :dashboard, only: [:show], controller: :dashboard
  resource :clean, only: [:destroy], controller: :clean
  resources :requests, only: %i[index show]
  resources :exceptions, only: %i[index show]
  resources :queries, only: %i[index show]
  resources :jobs, only: %i[index show]

  namespace :widgets do
    get 'slowest-requests', action: :show, controller: :slowest_requests
    get 'slowest-queries', action: :show, controller: :slowest_queries
  end
end
