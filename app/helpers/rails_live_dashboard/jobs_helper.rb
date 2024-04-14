module RailsLiveDashboard
  module JobsHelper
    def job_history_icon(status)
      case status
      when 'enqueued'
        lucide_icon('list-start',
                    class: 'h-8 w-8 p-1.5 rounded-full flex items-center justify-center ring-1 ring-inset bg-orange-50 text-orange-700 ring-orange-700/10')
      when 'started'
        lucide_icon('list-video',
                    class: 'h-8 w-8 p-1.5 rounded-full flex items-center justify-center ring-1 ring-inset bg-blue-50 text-blue-700 ring-blue-700/10')
      when 'performed'
        lucide_icon('check',
                    class: 'h-8 w-8 p-1.5 rounded-full flex items-center justify-center ring-1 ring-inset bg-green-50 text-green-700 ring-green-700/10')
      when 'discarted'
        lucide_icon('trash',
                    class: 'h-8 w-8 p-1.5 rounded-full flex items-center justify-center ring-1 ring-inset bg-red-50 text-red-700 ring-red-700/10')
      else
        lucide_icon('refresh-cw',
                    class: 'h-8 w-8 p-1.5 rounded-full flex items-center justify-center ring-1 ring-inset bg-orange-50 text-orange-700 ring-orange-700/10')
      end
    end

    def job_duration_text(duration)
      return "#{duration} ms" if duration < 1000

      "#{(duration / 1000).round} s"
    end
  end
end
