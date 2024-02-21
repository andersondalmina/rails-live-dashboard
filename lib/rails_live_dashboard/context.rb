require 'singleton'

module RailsLiveDashboard
  class Context
    include Singleton

    def start
      @batch_id = SecureRandom.uuid
    end

    def batch_id
      @batch_id ||= SecureRandom.uuid
    end

    def reset
      @batch_id = nil
    end
  end
end
