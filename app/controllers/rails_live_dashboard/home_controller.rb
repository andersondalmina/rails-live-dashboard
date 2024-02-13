module RailsLiveDashboard
  class HomeController < ApplicationController
    def show
      @ruby_version = RUBY_VERSION
      @rails_version = Rails.version
    end
  end
end
