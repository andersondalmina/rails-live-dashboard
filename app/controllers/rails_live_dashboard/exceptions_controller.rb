module RailsLiveDashboard
  class ExceptionsController < ApplicationController
    def index
      @exceptions = Exception
        .where(should_show: true)
        .order(created_at: :desc)
    end

    def show
      @exception = Exception.find(params[:id])
    end
  end
end
