module RailsLiveDashboard
  class Engine < ::Rails::Engine
    isolate_namespace RailsLiveDashboard

    initializer 'rails_live_dashboard', after: :load_config_initializers do |app|
      next unless RailsLiveDashboard.configuration.enabled

      app.routes.prepend do
        mount RailsLiveDashboard::Engine, at: '/live-dashboard'
      end
    end

    initializer 'rails_live_dashboard.assets.precompile' do |app|
      next unless RailsLiveDashboard.configuration.enabled

      app.config.assets.precompile += [
        'builds/rails_live_dashboard/application.js',
        'builds/rails_live_dashboard/application.css',
      ]
    end

    initializer 'rails_live_dashboard.action_controller' do
      next unless RailsLiveDashboard.configuration.enabled

      Subscribers::ActionControllerSubscriber.new
    end
  end
end
