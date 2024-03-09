module RailsLiveDashboard
  class Current < ActiveSupport::CurrentAttributes
    attribute :batch_id

    def initialize
      super
      self.batch_id = SecureRandom.uuid
    end
  end
end
