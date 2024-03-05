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
            started_at: nil,
            finished_at: nil,
            duration: nil,
            history: build_history
          }
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
