module RailsLiveDashboard
  module Recorders
    module Jobs
      class DiscardRecorder
        def initialize(event)
          @event = event
        end

        def execute
          raise Exceptions::EntryNotFound.new(:job, @event.payload[:job].job_id) if job.nil?

          job.update(content: build_content)
        end

        private

        def job
          @job = Job.find_by(batch_id: @event.payload[:job].job_id)
        end

        def build_content
          job.content.merge(
            {
              status: :discarded,
              finished_at: Time.now,
              duration: duration,
              history: build_history
            }
          )
        end

        def duration
          (Time.now - job.content.started_at).round(2)
        end

        def build_history
          job.content.history.push({
            status: :discarted,
            date: Time.now
          })
        end
      end
    end
  end
end
