module RailsLiveDashboard
  module Recorders
    class ExceptionRecorder
      def initialize(exception)
        @exception = exception
      end

      def execute
        Exception.of_class(@exception.class).update_all(should_show: false)

        Exception.create(
          batch_id: RailsLiveDashboard::Context.instance.batch_id,
          content: build_content
        )
      end

      private

      def build_content
        occurrences = Exception.of_class(@exception.class).count

        {
          class: @exception.class,
          message: @exception.message,
          file: file_line[0],
          line: file_line[1],
          backtrace: @exception.backtrace,
          occurrences: occurrences + 1
        }
      end

      def file_line
        return ['', ''] unless @exception.backtrace

        file = @exception.backtrace[0].split(':').first
        line = @exception.backtrace[0].split(':')[1]

        [file, line]
      end
    end
  end
end
