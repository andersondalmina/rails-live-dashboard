module RailsLiveDashboard
  class JobsController < ApplicationController
    def index
      @jobs = Job.order(created_at: :desc)
    end

    def show
      @job = Job.find(params[:id])
      @queries = Query.where(batch_id: @job.batch_id)
    end
  end
end
