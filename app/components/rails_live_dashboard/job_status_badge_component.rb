# frozen_string_literal: true

module RailsLiveDashboard
  class JobStatusBadgeComponent < ViewComponent::Base
    CLASSES = {
      enqueued: 'bg-orange-50 text-orange-700 ring-orange-700/10',
      started: 'bg-blue-50 text-blue-700 ring-blue-700/10',
      performed: 'bg-green-50 text-green-700 ring-green-600/20',
      discarted: 'bg-red-50 text-red-800 ring-red-600/20'
    }.freeze

    def initialize(status)
      super

      return if status.nil?

      @status = status.upcase
      @classes = CLASSES[status.downcase.to_sym]
    end
  end
end
