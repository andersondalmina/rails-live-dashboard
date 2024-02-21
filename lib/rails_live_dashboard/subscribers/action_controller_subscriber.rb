module RailsLiveDashboard
  module Subscribers
    class ActionControllerSubscriber
      def initialize
        ActiveSupport::Notifications.subscribe 'start_processing.action_controller' do |_event|
          RailsLiveDashboard::Context.instance.start
        end

        ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |event|
          next if event.payload[:controller].include?('RailsLiveDashboard')

          handle_event(event)
        rescue StandardError => e
          Rails.logger.error "Error on handle action controller event: #{e.message}"
        end
      end

      private

      def handle_event(event)
        Recorders::RequestRecorder.new(event).execute
        Recorders::ExceptionRecorder.new(event.payload[:exception_object]).execute if event.payload[:exception_object]

        RailsLiveDashboard::Context.instance.reset
      end
    end
  end
end
