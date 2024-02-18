require 'test_helper'

module RailsLiveDashboard
  class DashboardControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should render dashboard page' do
      get dashboard_url
      assert_response :success
    end
  end
end
