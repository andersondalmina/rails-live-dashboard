module RailsLiveDashboard
  module Recorders
    class ExceptionRecorder
      def initialize(exception)
        @exception = exception
      end

      def execute
        Exception.same(@exception.class, @exception.message).update_all(should_show: false)

        Exception.create(
          batch_id: RailsLiveDashboard::Context.instance.batch_id,
          content: build_content
        )
      end

      private

      def build_content
        occurrences = Exception.same(@exception.class, @exception.message).count

        {
          class: @exception.class,
          message: @exception.message,
          file: backtrace_data[1],
          line: backtrace_data[2],
          backtrace: backtrace_data[0],
          occurrences: occurrences + 1
        }
      end

      def backtrace_data
        backtrace = Rails.backtrace_cleaner.clean(@exception.backtrace)

        return ['', '', ''] if backtrace.empty?

        file = backtrace[0].split(':').first
        line = backtrace[0].split(':')[1]

        [backtrace, file, line]
      end
    end
  end
end
