require 'test_helper'

module RailsLiveDashboard
  module Jobs
    class StartRecorderTest < ActiveSupport::TestCase
      setup do
        Current.batch_id = 12_345
        Exception.destroy_all
      end

      test 'should create exception entry' do
        exception = RailsLiveDashboard::Types::ExceptionContent::CONTENT_STRUCT.new

        RailsLiveDashboard::Recorders::ExceptionRecorder.new(exception).execute

        assert_equal 1, Exception.should_show.count
      end
    end
  end
end
