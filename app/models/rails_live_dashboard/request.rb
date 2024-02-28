module RailsLiveDashboard
  class Request < Entry
    attribute :content, Types::RequestContent.new

    after_create_commit lambda {
      broadcast_prepend_later_to 'request_list', target: 'requests'
    }

    def turbo_stream?
      content.format == 'turbo_stream'
    end
  end
end
