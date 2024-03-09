module RailsLiveDashboard
  class Exception < Entry
    attribute :content, Types::ExceptionContent.new

    scope :same, lambda { |exception_class, message|
      where("content->>'class' = ? AND content->>'message' = ?", exception_class, message)
    }
  end
end
