module RailsLiveDashboard
  class Request < Entry
    attribute :content, Types::RequestContent.new

    def method
      content.method
    end

    def path
      content.path
    end

    def status_code
      content.status
    end

    def controller
      content.controller
    end

    def controller_action
      content.action
    end

    def duration
      content.duration.round
    end

    def payload
      content.params
    end

    def headers
      content.headers
    end

    def body
      content.body
    end

    def turbo_stream?
      content.format == 'turbo_stream'
    end
  end
end
