require 'test_helper'

module RailsLiveDashboard
  class CleanControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should delete all records and redirect' do
      delete clean_url
      assert_response :see_other
    end
  end
end
