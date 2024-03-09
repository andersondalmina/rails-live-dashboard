require 'test_helper'

module RailsLiveDashboard
  class RequestRecorderTest < ActiveSupport::TestCase
    setup do
      Current.batch_id = 12_345
      Request.destroy_all
    end

    test 'when receive a html request event should create request entry' do
      event = html_event
      entry = Recorders::RequestRecorder.new(event).execute

      assert_equal 1, Request.should_show.count
      assert_equal 'GET', entry.content.method
      assert_equal '/test', entry.content.path
      assert_equal 200, entry.content.status
      assert_equal 'TestController', entry.content.controller
      assert_equal 'index', entry.content.action
      assert_equal 10_000, entry.content.duration.to_i
      assert_equal '[]', entry.content.params
      assert_equal false, entry.turbo_stream?
    end

    test 'when receive a turbo request event should create request entry' do
      event = turbo_event
      entry = Recorders::RequestRecorder.new(event).execute

      assert_equal 1, Request.should_show.count
      assert_equal 'GET', entry.content.method
      assert_equal '/test', entry.content.path
      assert_equal 200, entry.content.status
      assert_equal 'TestController', entry.content.controller
      assert_equal 'index', entry.content.action
      assert_equal 10_000, entry.content.duration.to_i
      assert_equal '[]', entry.content.params
      assert_equal true, entry.turbo_stream?
    end

  private

    def html_event
      request_mock = ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'GET' })
      response_mock = ActionDispatch::Response.new(200, {}, [])

      event = ActiveSupport::Notifications::Event.new(
        'Test request',
        Time.now,
        Time.now + 10.seconds,
        '',
        {
          controller: 'TestController',
          action: 'index',
          params: '[]',
          format: 'html',
          method: 'GET',
          path: '/test',
          status: 200,
          headers: {},
          body: {},
          view_duration: 2,
          db_duration: 3,
          request: request_mock,
          response: response_mock
        }
      )
    end

    def turbo_event
      request_mock = ActionDispatch::Request.new({ 'REQUEST_METHOD' => 'GET' })
      response_mock = ActionDispatch::Response.new(200, {}, [])

      event = ActiveSupport::Notifications::Event.new(
        'Test request',
        Time.now,
        Time.now + 10.seconds,
        '',
        {
          controller: 'TestController',
          action: 'index',
          params: '[]',
          format: 'turbo_stream',
          method: 'GET',
          path: '/test',
          status: 200,
          headers: {},
          body: {},
          view_duration: 2,
          db_duration: 3,
          request: request_mock,
          response: response_mock
        }
      )
    end
  end
end
