class JobController < ApplicationController
  def index
    TestJob.perform_later
  end

  def later
    TestJob.set(wait: 1.minute).perform_later
  end
end
