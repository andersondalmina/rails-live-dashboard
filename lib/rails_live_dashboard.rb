require 'rails_live_dashboard/version'
require 'rails_live_dashboard/engine'
require 'rails_live_dashboard/configuration'
require 'rails_live_dashboard/context'
require 'rails_live_dashboard/recorders/exception_recorder'
require 'rails_live_dashboard/recorders/request_recorder'
require 'rails_live_dashboard/recorders/query_recorder'
require 'rails_live_dashboard/subscribers/action_controller_subscriber'
require 'rails_live_dashboard/subscribers/active_record_subscriber'

module RailsLiveDashboard
  def self.configuration
    @configuration ||= Configuration.instance
  end

  def self.configure
    yield(configuration)
  end
end
