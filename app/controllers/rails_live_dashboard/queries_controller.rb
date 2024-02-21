module RailsLiveDashboard
  class QueriesController < ApplicationController
    def index
      @queries = Query.order(created_at: :desc)
    end

    def show
      @query = Query.find(params[:id])
    end
  end
end
