module RailsLiveDashboard
  module Recorders
    module Jobs
      class PerformRecorder
        def initialize(event)
          @event = event
          @job = Job.same(@event.payload[:job].job_id).first
        end

        def execute
          raise Exceptions::EntryNotFound.new(:job, @event.payload[:job].job_id) if @job.nil?

          build_content
          build_history

          @job.update(content:)
        end

        private

        def content
          @content ||= @job.content
        end

        def build_content
          content.status = :performed
          content.finished_at = Time.now
          content.duration = duration
        end

        def build_history
          content.history.push({
            status: :performed,
            date: Time.now
          })
        end

        def duration
          return 0 if content.started_at.nil?

          (content.finished_at - Time.parse(content.started_at)).in_milliseconds.round
        end
      end
    end
  end
end
