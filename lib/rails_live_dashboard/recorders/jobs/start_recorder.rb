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

          build_content
          build_history

          @job.update!(content: @job.content.to_h)
        end

        private

        def build_content
          @job.content.status = :started
          @job.content.started_at = Time.now
        end

        def build_history
          @job.content.history.push({
            status: :started,
            date: Time.now
          })
        end
      end
    end
  end
end
