module RailsLiveDashboard
  module Recorders
    module Jobs
      class EnqueueRecorder
        def initialize(event)
          @event = event
        end

        def execute
          Job.create(
            batch_id: @event.payload[:job].job_id,
            content: build_content
          )
        end

        private

        def build_content
          {
            job_name: @event.payload[:job].class,
            job_id: @event.payload[:job].job_id,
            params: @event.payload[:job].arguments || {},
            status: :enqueued,
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
          [
            {
              status: :enqueued,
              date: Time.now
            }
          ]
        end
      end
    end
  end
end
