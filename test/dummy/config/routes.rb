Rails.application.routes.draw do
  mount RailsLiveDashboard::Engine, at: '/live-dashboard' unless Rails.env.production?
end
