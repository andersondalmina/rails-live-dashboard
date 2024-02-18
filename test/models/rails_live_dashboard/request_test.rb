require 'test_helper'

module RailsLiveDashboard
  class RequestTest < ActiveSupport::TestCase
    test 'should show only where should_show is true' do
      assert_equal 3, Request.should_show.count
    end
  end
end
