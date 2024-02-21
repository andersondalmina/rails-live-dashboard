# frozen_string_literal: true

module RailsLiveDashboard
  class QueryDurationBadgeComponent < ViewComponent::Base
    CLASSES = {
      ok: 'bg-green-50 text-green-700 ring-green-600/20',
      warning: 'bg-orange-50 text-orange-700 ring-orange-600/10',
      danger: 'bg-red-50 text-red-700 ring-red-600/10'
    }.freeze

    def initialize(duration)
      super

      @duration = duration
      @classes = duration_classes
    end

    private

    def duration_classes
      return CLASSES[:ok] if @duration < 10
      return CLASSES[:warning] if @duration < 100

      CLASSES[:danger]
    end
  end
end
