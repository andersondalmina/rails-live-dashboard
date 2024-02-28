module RailsLiveDashboard
  class Query < Entry
    attribute :content, Types::QueryContent.new

    after_create_commit lambda {
      broadcast_prepend_later_to 'query_list', target: 'queries'
    }
  end
end
