module RailsLiveDashboard
  module Types
    class Content < ActiveRecord::Type::Value
      CONTENT_STRUCT = Struct.new(*self.PAYLOAD)

      def type
        :jsonb
      end

      def cast(value)
        sanitized = sanitize_input(value)
        CONTENT_STRUCT.new(**sanitized)
      end

      def deserialize(value)
        decoded = ActiveSupport::JSON.decode(value)
        sanitized = sanitize_input(decoded)
        CONTENT_STRUCT.new(**sanitized)
      end

      def serialize(value)
        ActiveSupport::JSON.encode(value)
      end

      private

      def sanitize_input(input)
        input.slice(*self.PAYLOAD)
      end
    end
  end
end
