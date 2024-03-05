class TestJob < ApplicationJob
  queue_as :default

  def perform(test_param, named_param:)
    p test_param
    p named_param

    sleep 1.minute
  end
end
