# frozen_string_literal: true

require 'test_helper'

module RailsLiveDashboard
  class RequestStatusBadgeComponentTest < ViewComponent::TestCase
    def test_badge_for_status_100
      result = render_inline(RequestStatusBadgeComponent.new(100))

      assert_includes result.to_html, 'bg-blue-50 text-blue-700 ring-blue-700/10'
      assert_includes result.to_html, '100'
    end

    def test_badge_for_status_200
      result = render_inline(RequestStatusBadgeComponent.new(200))

      assert_includes result.to_html, 'bg-green-50 text-green-700 ring-green-600/20'
      assert_includes result.to_html, '200'
    end

    def test_badge_for_status_300
      result = render_inline(RequestStatusBadgeComponent.new(300))

      assert_includes result.to_html, 'bg-yellow-50 text-yellow-800 ring-yellow-600/20'
      assert_includes result.to_html, '300'
    end

    def test_badge_for_status_400
      result = render_inline(RequestStatusBadgeComponent.new(400))

      assert_includes result.to_html, 'bg-orange-50 text-orange-700 ring-orange-600/10'
      assert_includes result.to_html, '400'
    end

    def test_badge_for_status_500
      result = render_inline(RequestStatusBadgeComponent.new(500))

      assert_includes result.to_html, 'bg-red-50 text-red-700 ring-red-600/10'
      assert_includes result.to_html, '500'
    end
  end
end
