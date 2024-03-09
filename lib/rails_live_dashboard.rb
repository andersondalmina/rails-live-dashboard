require 'rails_live_dashboard/version'
require 'rails_live_dashboard/engine'
require 'rails_live_dashboard/configuration'
require 'rails_live_dashboard/exceptions/entry_not_found'
require 'rails_live_dashboard/recorders/exception_recorder'
require 'rails_live_dashboard/recorders/request_recorder'
require 'rails_live_dashboard/recorders/query_recorder'
require 'rails_live_dashboard/recorders/jobs/discard_recorder'
require 'rails_live_dashboard/recorders/jobs/enqueue_recorder'
require 'rails_live_dashboard/recorders/jobs/perform_recorder'
require 'rails_live_dashboard/recorders/jobs/start_recorder'
require 'rails_live_dashboard/subscribers/action_controller_subscriber'
require 'rails_live_dashboard/subscribers/active_record_subscriber'
require 'rails_live_dashboard/subscribers/active_job_subscriber'

module RailsLiveDashboard
  def self.configuration
    @configuration ||= Configuration.instance
  end

  def self.configure
    yield(configuration)
  end
end
