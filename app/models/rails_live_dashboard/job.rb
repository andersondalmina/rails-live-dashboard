module RailsLiveDashboard
  class Job < Entry
    attribute :content, Types::JobContent.new
  end
end
