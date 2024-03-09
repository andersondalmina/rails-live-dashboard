module RailsLiveDashboard
  module Recorders
    class RequestRecorder
      def initialize(event)
        @event = event
      end

      def execute
        Request.create(
          batch_id: Current.batch_id,
          content: build_content
        )
      end

      private

      def build_content
        payload = @event.payload
        payload.merge(
          {
            headers: payload[:request].headers.env.reject { |key| key.to_s.include?('.') },
            body: payload[:response]&.body || nil,
            duration: @event.duration.round(2),
            allocations: @event.allocations
          }
        )
      end
    end
  end
end
