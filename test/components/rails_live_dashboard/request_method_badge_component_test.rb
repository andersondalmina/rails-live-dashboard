# frozen_string_literal: true

require 'test_helper'

module RailsLiveDashboard
  class RequestMethodBadgeComponentTest < ViewComponent::TestCase
    def test_badge_for_method_get
      result = render_inline(RequestMethodBadgeComponent.new('GET'))

      assert_includes result.to_html, 'fill-green-500'
      assert_includes result.to_html, 'GET'
    end

    def test_badge_for_method_get_with_turbo_stream
      result = render_inline(RequestMethodBadgeComponent.new('GET', turbo_stream: true))

      assert_includes result.to_html, 'fill-green-500'
      assert_includes result.to_html, 'GET'
      assert_includes result.to_html, 'Turbo Stream'
    end

    def test_badge_for_method_post
      result = render_inline(RequestMethodBadgeComponent.new('POST'))

      assert_includes result.to_html, 'fill-yellow-500'
      assert_includes result.to_html, 'POST'
    end

    def test_badge_for_method_post_with_turbo_stream
      result = render_inline(RequestMethodBadgeComponent.new('POST', turbo_stream: true))

      assert_includes result.to_html, 'fill-yellow-500'
      assert_includes result.to_html, 'POST'
      assert_includes result.to_html, 'Turbo Stream'
    end

    def test_badge_for_method_put
      result = render_inline(RequestMethodBadgeComponent.new('PUT'))

      assert_includes result.to_html, 'fill-blue-500'
      assert_includes result.to_html, 'PUT'
    end

    def test_badge_for_method_put_with_turbo_stream
      result = render_inline(RequestMethodBadgeComponent.new('PUT', turbo_stream: true))

      assert_includes result.to_html, 'fill-blue-500'
      assert_includes result.to_html, 'PUT'
      assert_includes result.to_html, 'Turbo Stream'
    end
  end
end
