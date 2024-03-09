module RailsLiveDashboard
  module Recorders
    module Jobs
      class StartRecorder
        def initialize(event)
          @event = event
          @job = Job.same(@event.payload[:job].job_id).first
        end

        def execute
          raise Exceptions::EntryNotFound.new(:job, @event.payload[:job].job_id) if @job.nil?

          Current.batch_id = @job.batch_id

          build_content
          build_history

          @job.update(content: content)
        end

        private

        def content
          @content ||= @job.content
        end

        def build_content
          content.status = :started
          content.started_at = Time.now
        end

        def build_history
          content.history.push({
            status: :started,
            date: Time.now
          })
        end
      end
    end
  end
end
