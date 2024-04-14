module RailsLiveDashboard
  module Recorders
    class QueryRecorder
      def initialize(event)
        @event = event
      end

      def execute
        Query.create(
          batch_id: Current.batch_id,
          content: build_content
        )
      end

      private

      def build_content
        payload = @event.payload
        {
          name: payload[:name],
          sql: payload[:sql].strip.gsub(/(^(\s+)?$\n)/, ''),
          parameters: payload[:type_casted_binds],
          duration: (@event.end - @event.time).round(2),
          kind: payload[:sql].match(/INSERT|UPDATE|DELETE/) ? 'WRITE' : 'READ',
          cached: payload[:cached] ? true : false
        }
      end
    end
  end
end
