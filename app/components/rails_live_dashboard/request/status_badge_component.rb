# frozen_string_literal: true
module RailsLiveDashboard
  class Request::StatusBadgeComponent < ViewComponent::Base
    CLASSES = {
      100..199 => 'bg-blue-50 text-blue-700 ring-blue-700/10',
      200..299 => 'bg-green-50 text-green-700 ring-green-600/20',
      300..399 => 'bg-yellow-50 text-yellow-800 ring-yellow-600/20',
      400..499 => 'bg-orange-50 text-orange-700 ring-orange-600/10',
      500..599 => 'bg-red-50 text-red-700 ring-red-600/10',
    }

    def initialize(status)
      @status = status
      @classes = CLASSES.detect{|k, v| k === status}.last
    end
  end
end
