require "test_helper"

module RailsLiveDashboard
  class CleanControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get destroy" do
      get clean_destroy_url
      assert_response :success
    end
  end
end
