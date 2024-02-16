module RailsLiveDashboard
  class InstallGenerator < Rails::Generators::Base
    desc 'Create configuration file to RailsLiveDashboard'

    source_root File.expand_path('../templates', __dir__)

    def copy_initializer_file
      copy_file 'initializer.rb', Rails.root.join('config/initializers/rails_live_dashboard.rb')
    end
  end
end
