module RailsLiveDashboard
  class Job < Entry
    attribute :content, Types::JobContent.new

    scope :same, ->(job_id) { where("content->>'job_id' = ?", job_id) }

    def performed?
      content.status == 'performed'
    end

    def discarted?
      content.status == 'discarted'
    end
  end
end
