require 'test_helper'

module RailsLiveDashboard
  class RequestsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should render requests page' do
      get requests_url
      assert_response :success
    end
  end
end
