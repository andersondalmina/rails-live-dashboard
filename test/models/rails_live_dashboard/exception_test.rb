require 'test_helper'

module RailsLiveDashboard
  class ExceptionTest < ActiveSupport::TestCase
    test 'should show only where should_show is true' do
      assert_equal 2, Exception.should_show.count
    end
  end
end
