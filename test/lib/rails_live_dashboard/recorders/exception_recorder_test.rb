require 'test_helper'

ExceptionStruct = Struct.new(:class, :message, :backtrace)

module RailsLiveDashboard
  class ExceptionRecorderTest < ActiveSupport::TestCase
    setup do
      Exception.destroy_all
    end

    test 'should create exception entry' do
      batch_id = SecureRandom.uuid

      exception = ExceptionStruct.new

      RailsLiveDashboard::Recorders::ExceptionRecorder.new(batch_id, exception).execute

      assert_equal 1, Exception.should_show.count
    end
  end
end
