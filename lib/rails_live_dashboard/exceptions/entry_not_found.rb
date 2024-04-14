module RailsLiveDashboard
  module Exceptions
    class EntryNotFound < StandardError
      def initialize(type, id)
        super("#{type}(id: #{id}) entry not found")
      end
    end
  end
end
