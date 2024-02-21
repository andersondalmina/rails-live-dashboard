module RailsLiveDashboard
  class RequestsController < ApplicationController
    def index
      @requests = Request.order(created_at: :desc)
    end

    def show
      @request = Request.find(params[:id])
      @exceptions = Exception.where(batch_id: @request.batch_id)
      @queries = Query.where(batch_id: @request.batch_id)
    end
  end
end
