class TestJob < ApplicationJob
  queue_as :default

  def perform(test_param, named_param:)
    logger.info("Test job params: #{test_param} - #{named_param}")

    sleep 10.seconds

    tests = Test.all
    logger.info("Found tests: #{tests.count}")
  end
end
