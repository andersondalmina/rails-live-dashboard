module RailsLiveDashboard
  module Recorders
    class RequestRecorder
      def initialize(batch_id, event)
        @batch_id = batch_id
        @event = event
      end

      def execute
        payload = @event.payload
        request = payload[:request]
        response = payload[:response]

        Request.create(
          batch_id: @batch_id,
          content: {
            controller: payload[:controller],
            action: payload[:action],
            params: payload[:params],
            format:	payload[:format],
            method:	payload[:method],
            path: payload[:path],
            status:	payload[:status],
            headers: request.headers.env.reject { |key| key.to_s.include?('.') },
            body: response&.body || nil,
            duration: @event.duration,
            view_duration: payload[:view_runtime],
            db_duration: payload[:db_runtime],
            allocations: @event.allocations
          }
        )
      end
    end
  end
end
