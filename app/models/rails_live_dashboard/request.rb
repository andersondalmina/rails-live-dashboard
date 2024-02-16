module RailsLiveDashboard
  class Request < Entry
    def method
      self.content['method']
    end

    def path
      self.content['path']
    end

    def status_code
      self.content['status']
    end

    def controller
      self.content["controller"]
    end

    def controller_action
      self.content["action"]
    end

    def duration
      self.content["duration"].round
    end

    def payload
      self.content["params"]
    end

    def headers
      self.content["headers"]
    end

    def body
      self.content["body"]
    end

    def turbo_stream?
      self.content["format"] == "turbo_stream"
    end
  end
end
