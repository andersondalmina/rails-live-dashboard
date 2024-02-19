module RailsLiveDashboard
  module Recorders
    class RequestRecorder
      def initialize(batch_id, event)
        @batch_id = batch_id
        @event = event
      end

      def execute
        Request.create(
          batch_id: @batch_id,
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
            duration: @event.duration,
            allocations: @event.allocations
          }
        )
      end
    end
  end
end
