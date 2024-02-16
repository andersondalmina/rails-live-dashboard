# frozen_string_literal: true

module RailsLiveDashboard
  class Request::MethodBadgeComponent < ViewComponent::Base
    CLASSES = {
      get: 'fill-green-500',
      post: 'fill-yellow-500',
      put: 'fill-blue-500',
      patch: 'fill-indigo-500',
      delete: 'fill-red-500',
      head: 'fill-green-500',
      option: 'fill-purple-500',
    }

    def initialize(method, turbo_stream = false)
      @classes = CLASSES[method.downcase.to_sym]
      @method = "#{method} #{ '- Turbo Stream' if turbo_stream }"
    end
  end
end