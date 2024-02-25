module RailsLiveDashboard
  module Widgets
    class SlowestQueriesController < ApplicationController
      def show
        @queries = Query
          .order(Arel.sql("cast(content->>'duration' as float) DESC"))
          .limit(5)
      end
    end
  end
end
