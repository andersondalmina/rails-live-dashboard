module RailsLiveDashboard
  class CleanController < ApplicationController
    def destroy
      Entry.delete_all

      redirect_to dashboard_path, status: :see_other
    end
  end
end
