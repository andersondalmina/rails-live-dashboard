module RailsLiveDashboard
  module Widgets
    class SlowestRequestsController < ApplicationController
      def show
        @requests = Request
          .order(Arel.sql("cast(content->>'duration' as float) DESC"))
          .limit(5)
      end
    end
  end
end
