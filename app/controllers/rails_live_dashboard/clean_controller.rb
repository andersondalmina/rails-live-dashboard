module RailsLiveDashboard
  class CleanController < ApplicationController
    def destroy
      Entry.delete_all

      redirect_back fallback_location: dashboard_path, status: :see_other
    end
  end
end
