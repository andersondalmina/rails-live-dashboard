module RailsLiveDashboard
  module Types
    class RequestContent < ActiveRecord::Type::Value
      PAYLOAD =
        %i[
          controller
          action
          params
          format
          method
          path
          status
          headers
          body
          duration
          view_duration
          db_duration
          allocations
        ].freeze

      CONTENT_STRUCT = Struct.new(*PAYLOAD)

      def type
        :jsonb
      end

      def cast(value)
        sanitized = sanitize_input(value)
        CONTENT_STRUCT.new(**sanitized)
      end

      def deserialize(value)
        decoded = ActiveSupport::JSON.decode(value).symbolize_keys
        sanitized = sanitize_input(decoded)
        CONTENT_STRUCT.new(**sanitized)
      end

      def serialize(value)
        ActiveSupport::JSON.encode(value)
      end

      private

      def sanitize_input(input)
        input.slice(*PAYLOAD)
      end
    end
  end
end
