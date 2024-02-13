Rails.application.routes.draw do
  mount RailsLiveDashboard::Engine => "/live-dashboard"
end
