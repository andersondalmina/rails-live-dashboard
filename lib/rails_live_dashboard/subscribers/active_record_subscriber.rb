module RailsLiveDashboard
  module Subscribers
    class ActiveRecordSubscriber
      def initialize
        ActiveSupport::Notifications.subscribe 'sql.active_record' do |event|
          next if should_skip(event)

          Recorders::QueryRecorder.new(event).execute
        rescue StandardError => e
          Rails.logger.error "ActionRecordSubscriber - Error on handle active record event: #{e.message}"
        end
      end

      private

      def should_skip(event)
        event.payload[:name].blank? ||
          event.payload[:name].match(/SCHEMA|TRANSACTION|ActiveRecord|RailsLiveDashboard/) ||
          event.payload[:sql].match(/BEGIN|COMMIT/)
      end
    end
  end
end
