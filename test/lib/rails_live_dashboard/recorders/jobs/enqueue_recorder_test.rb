require 'test_helper'
require 'ostruct'

module RailsLiveDashboard
  module Jobs
    class EnqueueRecorderTest < ActiveSupport::TestCase
      setup do
        Current.batch_id = 12_345
        Job.destroy_all
      end

      test 'should create job enqueue entry' do
        Recorders::Jobs::EnqueueRecorder.new(job_event).execute

        assert_equal 1, Job.count
      end

      private

      def job_event
        ActiveSupport::Notifications::Event.new(
          'Job event',
          Time.now,
          Time.now + 10.seconds,
          '',
          {
            job: job_struct
          }
        )
      end

      def job_struct
        OpenStruct.new(
          class: 'TestJob',
          job_id: '12345',
          arguments: {},
          queue_name: 'test'
        )
      end
    end
  end
end
