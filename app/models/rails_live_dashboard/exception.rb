module RailsLiveDashboard
  class Exception < Entry
    scope :of_class, ->(exception_class) { where("content->>'class' = ?", exception_class) }

    def class_name
      content['class']
    end

    def message
      content['message']
    end

    def occurrences
      content['occurrences']
    end

    def file
      content['file']
    end

    def line
      content['line']
    end

    def backtrace
      content['backtrace']
    end
  end
end
