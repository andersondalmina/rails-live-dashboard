module RailsLiveDashboard
  module Types
    class ExceptionContent < ActiveRecord::Type::Value
      PAYLOAD =
        %i[
          class
          message
          file
          line
          backtrace
          occurrences
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
