require "test_helper"

class ExceptionRecorderTest < ActiveSupport::TestCase
  test "should initialize in request processor" do
    batch_id = SecureRandom.uuid
    event = ActiveSupport::Notifications::Event.new() 

    RailsLiveDashboard::Recorders::ExceptionRecorder.new(batch_id, event)
  end
end