module RailsLiveDashboard
  class Entry < ApplicationRecord
    scope :should_show, -> { where(should_show: true) }
  end
end
