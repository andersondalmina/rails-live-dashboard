class TestJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    sleep 1.minute
  end
end
