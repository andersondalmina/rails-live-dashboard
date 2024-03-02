require "test_helper"

module RailsLiveDashboard
  class JobsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get jobs_index_url
      assert_response :success
    end

    test "should get show" do
      get jobs_show_url
      assert_response :success
    end
  end
end
