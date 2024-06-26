module RailsLiveDashboard
  module Types
    class JobContent < ActiveRecord::Type::Value
      PAYLOAD =
        %i[
          job_name
          job_id
          params
          status
          queue_name
          started_at
          finished_at
          duration
          db_duration
          error
          history
        ].freeze

      CONTENT_STRUCT = Struct.new(*PAYLOAD)

      def type
        :jsonb
      end

      def cast(value)
        return value if value.is_a?(CONTENT_STRUCT)

        sanitized = sanitize_input(value)
        CONTENT_STRUCT.new(**sanitized)
      end

      def deserialize(value)
        decoded = ActiveSupport::JSON.decode(value)&.symbolize_keys
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
