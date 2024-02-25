# frozen_string_literal: true

require 'test_helper'

module RailsLiveDashboard
  class RequestDurationBadgeComponentTest < ViewComponent::TestCase
    def test_badge_for_ok
      result = render_inline(RequestDurationBadgeComponent.new(99))

      assert_includes result.to_html, 'bg-green-50'
      assert_includes result.to_html, '99'
    end

    def test_badge_for_warning
      result = render_inline(RequestDurationBadgeComponent.new(299))

      assert_includes result.to_html, 'bg-orange-50'
      assert_includes result.to_html, '299'
    end

    def test_badge_for_danger
      result = render_inline(RequestDurationBadgeComponent.new(600))

      assert_includes result.to_html, 'bg-red-50'
      assert_includes result.to_html, '600'
    end
  end
end
