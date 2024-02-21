# frozen_string_literal: true

require 'test_helper'

module RailsLiveDashboard
  class QueryDurationBadgeComponentTest < ViewComponent::TestCase
    def test_badge_for_ok
      result = render_inline(QueryDurationBadgeComponent.new(9))

      assert_includes result.to_html, 'bg-green-50'
      assert_includes result.to_html, '9'
    end

    def test_badge_for_warning
      result = render_inline(QueryDurationBadgeComponent.new(99))

      assert_includes result.to_html, 'bg-orange-50'
      assert_includes result.to_html, '99'
    end

    def test_badge_for_danger
      result = render_inline(QueryDurationBadgeComponent.new(100))

      assert_includes result.to_html, 'bg-red-50'
      assert_includes result.to_html, '100'
    end
  end
end
