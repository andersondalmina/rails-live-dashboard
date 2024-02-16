module RailsLiveDashboard
  class CleanController < ApplicationController
    def destroy
      raise StandardError.new('teste')
      Entry.delete_all
      
      redirect_to dashboard_path, status: :see_other
    end
  end
end
