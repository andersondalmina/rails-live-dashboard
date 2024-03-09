require 'test_helper'

module RailsLiveDashboard
  class QueryRecorderTest < ActiveSupport::TestCase
    setup do
      Current.batch_id = 12_345
      Query.destroy_all
    end

    test 'when receive a query event should create query entry' do
      event = ActiveSupport::Notifications::Event.new(
        'SQL Test',
        Time.now,
        Time.now + 1.hour,
        '',
        {
          name: 'SQL Test',
          sql: 'SELECT * FROM test WHERE ?',
          type_casted_binds: '[test]',
          cached: false
        }
      )

      entry = Recorders::QueryRecorder.new(event).execute

      assert_equal 1, Query.should_show.count
      assert_equal 'SELECT * FROM test WHERE ?', entry.content.sql
      assert_equal 'SQL Test', entry.content.name
      assert_equal '[test]', entry.content.parameters
      assert_equal 3_600_000, entry.content.duration.to_i
      assert_equal 'READ', entry.content.kind
      assert_equal false, entry.content.cached
    end
  end
end
