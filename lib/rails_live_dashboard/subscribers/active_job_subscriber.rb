module RailsLiveDashboard
  module Subscribers
    class ActiveJobSubscriber
      def initialize
        enqueue
        start
        perform
        discard
      end

      private

      def enqueue
        ActiveSupport::Notifications.subscribe 'enqueue_at.active_job' do |event|
          Recorders::Jobs::EnqueueRecorder.new(event).execute
        rescue StandardError => e
          Rails.logger.error "ActiveJobSubscriber - Error on handle enqueue job event: #{e.message}"
        end

        ActiveSupport::Notifications.subscribe 'enqueue.active_job' do |event|
          Recorders::Jobs::EnqueueRecorder.new(event).execute
        rescue StandardError => e
          Rails.logger.error "ActiveJobSubscriber - Error on handle enqueue job event: #{e.message}"
        end
      end

      def start
        ActiveSupport::Notifications.subscribe 'perform_start.active_job' do |event|
          Recorders::Jobs::StartRecorder.new(event).execute
        rescue StandardError => e
          Rails.logger.error "ActiveJobSubscriber - Error on handle perform_start job event: #{e.message}"
        end
      end

      def perform
        ActiveSupport::Notifications.subscribe 'perform.active_job' do |event|
          Recorders::Jobs::PerformRecorder.new(event).execute
        rescue StandardError => e
          Rails.logger.error "ActiveJobSubscriber - Error on handle perform job event: #{e.message}"
        end
      end

      def discard
        ActiveSupport::Notifications.subscribe 'discard.active_job' do |event|
          Recorders::Jobs::DiscardRecorder.new(event).execute
        rescue StandardError => e
          Rails.logger.error "ActiveJobSubscriber - Error on handle discard job event: #{e.message}"
        end
      end
    end
  end
end
