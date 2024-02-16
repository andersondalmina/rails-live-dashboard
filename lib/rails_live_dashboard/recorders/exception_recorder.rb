module RailsLiveDashboard
  module Recorders
    class ExceptionRecorder
      def initialize(batch_id, exception)
        @batch_id = batch_id
        @exception = exception
      end

      def execute
        Exception.transaction do
          Exception.of_class(@exception.class).update_all(should_show: false)

          occurrences = Exception.of_class(@exception.class).count

          Exception.create(
            batch_id: @batch_id,
            content: {
              class: @exception.class,
              message: @exception.message,
              file: @exception.backtrace[0].split(':').first,
              line: @exception.backtrace[0].split(':')[1],
              backtrace: @exception.backtrace,
              occurrences: occurrences + 1
            }
          )
        end
      end
    end
  end
end
