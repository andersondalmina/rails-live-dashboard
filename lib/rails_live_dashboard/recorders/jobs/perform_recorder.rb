module RailsLiveDashboard
  module Recorders
    module Jobs
      class PerformRecorder
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
          {
            job_name: @event.payload[:job].class,
            job_id: @event.payload[:job].job_id,
            params: @event.payload[:job].arguments || {},
            status: :performed,
            queue_name: @event.payload[:job].queue_name,
            duration: duration,
            db_duration: @event.payload[:db_runtime],
            history: build_history
          }
        end

        def duration
          (@event.end - @event.time).round(2)
        end

        def build_history
          job.content.history.push({
            status: :performed,
            date: Time.now
          })
        end
      end
    end
  end
end
