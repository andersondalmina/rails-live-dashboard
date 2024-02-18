require 'test_helper'

module RailsLiveDashboard
  class ExceptionsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should render exceptions page' do
      get exceptions_url
      assert_response :success
    end
  end
end
