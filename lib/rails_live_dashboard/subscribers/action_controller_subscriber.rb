module RailsLiveDashboard
  module Subscribers
    class ActionControllerSubscriber
      def initialize
        ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |event|
          next if event.payload[:controller].include?('RailsLiveDashboard')

          batch_id = SecureRandom.uuid
          Recorders::RequestRecorder.new(batch_id, event).execute

          if event.payload[:exception_object]
            Recorders::ExceptionRecorder.new(batch_id, event.payload[:exception_object]).execute
          end
        rescue StandardError => e
          Rails.logger.error "Error on handle action controller event: #{e.message}"
        end
      end
    end
  end
end
