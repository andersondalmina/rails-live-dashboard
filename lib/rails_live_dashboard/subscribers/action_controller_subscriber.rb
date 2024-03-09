module RailsLiveDashboard
  module Subscribers
    class ActionControllerSubscriber
      def initialize
        ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |event|
          next if should_skip(event)

          handle_event(event)
        rescue StandardError => e
          Rails.logger.error "Error on handle action controller event: #{e.message}"
        end
      end

      private

      def should_skip(event)
        event.payload[:controller].include?('RailsLiveDashboard')
      end

      def handle_event(event)
        Recorders::RequestRecorder.new(event).execute
        Recorders::ExceptionRecorder.new(event.payload[:exception_object]).execute if event.payload[:exception_object]
      end
    end
  end
end
