require 'singleton'

module RailsLiveDashboard
  class Configuration
    include Singleton

    attr_accessor :enabled

    def initialize
      @enabled = true
    end
  end
end
