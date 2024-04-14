require 'test_helper'
require 'ostruct'

module RailsLiveDashboard
  module Jobs
    class PerformRecorderTest < ActiveSupport::TestCase
      setup do
        Current.batch_id = 12_345
        Job.destroy_all
        create_started_job
      end

      test 'should set job as performed when found job' do
        Recorders::Jobs::PerformRecorder.new(job_event).execute

        assert_equal 1, Job.count
        assert_equal 'performed', Job.first.content.status
        assert_equal 3, Job.first.content.history.size
      end

      test 'should return error when not found job' do
        event = job_event
        event.payload[:job].job_id = 54_321

        assert_raise Exceptions::EntryNotFound do
          Recorders::Jobs::PerformRecorder.new(event).execute
        end
      end

      private

      def create_started_job
        content = job_struct.to_h
        content[:status] = :started
        content[:history] = [
          {
            status: :enqueue,
            date: Time.now
          },
          {
            status: :started,
            date: Time.now + 10.seconds
          }
        ]

        Job.create(
          batch_id: 12_345,
          content:
        )
      end

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
