Rails.application.routes.draw do
  mount RailsLiveDashboard::Engine, at: '/live-dashboard' unless Rails.env.production?

  get 'exception', action: :index, controller: :exceptions
  get 'job', action: :index, controller: :job
  get 'job/later', action: :later, controller: :job
end
