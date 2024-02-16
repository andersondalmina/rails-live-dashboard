module RailsLiveDashboard
  class Exception < Entry
    scope :of_class, ->(exception_class) { where("content->>'class' = ?", exception_class) }

    def class_name
      self.content['class']
    end

    def message
      self.content['message']
    end

    def occurrences
      self.content['occurrences']
    end

    def file
      self.content['file']
    end

    def line
      self.content['line']
    end

    def backtrace
      self.content['backtrace']
    end
  end
end
