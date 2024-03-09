class JobsController < ApplicationController
  def index
    TestJob.perform_later
  end

  def later
    TestJob.set(wait: 20.seconds).perform_later('Test param value', named_param: 12_345)
  end
end
